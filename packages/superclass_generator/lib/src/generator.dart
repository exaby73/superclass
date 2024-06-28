import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass/superclass.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/modifiers/merge.dart';
import 'package:superclass_generator/src/modifiers/omit.dart';
import 'package:superclass_generator/src/modifiers/partial.dart';
import 'package:superclass_generator/src/modifiers/pick.dart';
import 'package:superclass_generator/src/modifiers/required.dart';

class SuperclassGenerator extends GeneratorForAnnotation<Superclass> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! TypeAliasElement) {
      throw InvalidGenerationSourceError(
        '`@Superclass` can only be used on typedefs.',
        element: element,
      );
    }

    final (
      apply,
      classAnnotations,
      fieldAnnotations,
      includeJsonSerialization,
    ) = (
      annotation.read('apply').listValue,
      annotation.read('classAnnotations').listValue,
      annotation
          .read('fieldAnnotations')
          .mapValue
          .map((key, value) => MapEntry(key!.toStringValue()!, value)),
      annotation.read('includeJsonSerialization').boolValue,
    );
    final includeFreezed =
        includeJsonSerialization || annotation.read('includeFreezed').boolValue;

    if (apply.isEmpty) {
      throw InvalidGenerationSourceError(
        '`apply` must not be empty.',
        element: element,
      );
    }

    final buffer = StringBuffer();
    Map<String, Field> fields = <String, Field>{};
    final generatedName = '\$${element.name}';

    if (includeFreezed) {
      buffer.writeln('@freezed');
      buffer.writeln(_generateAnnotations(classAnnotations));
      buffer.write('class $generatedName with _\$$generatedName {');
    } else {
      buffer.write('class $generatedName {');
    }

    for (final item in apply) {
      final type = item.type;
      final name = type?.element?.name;
      if (type is! InterfaceType || name == null) continue;

      switch (name) {
        case 'Merge':
          fields = merge(fields, type);
        case 'Omit':
          final fieldsToOmit = item
              .getField('fields')!
              .toSetValue()!
              .map((e) => e.toStringValue()!)
              .toSet();
          fields = omit(fields, type, fieldsToOmit);
        case 'MakePartial':
          final onlyFields = item
              .getField('onlyFields')!
              .toSetValue()!
              .map((e) => e.toStringValue()!)
              .toSet();
          fields = partial(fields, type, onlyFields);
        case 'Pick':
          final fieldsToPick = item
              .getField('fields')!
              .toSetValue()!
              .map((e) => e.toStringValue()!)
              .toSet();
          fields = pick(fields, type, fieldsToPick);
        case 'MakeRequired':
          final onlyFields = item
              .getField('onlyFields')!
              .toSetValue()!
              .map((e) => e.toStringValue()!)
              .toSet();
          fields = required(fields, type, onlyFields);
        case _:
          continue;
      }
    }

    if (fields.isEmpty) {
      throw InvalidGenerationSourceError(
        'No fields found to merge.',
        element: element,
      );
    }

    if (includeFreezed) {
      buffer.writeln('const factory $generatedName({');
      for (final field in fields.values) {
        final fieldHasAnnotations = fieldAnnotations.containsKey(field.name) &&
            !fieldAnnotations[field.name]!.isNull;
        if (fieldHasAnnotations) {
          for (final annotation in _generateAnnotations(
            fieldAnnotations[field.name]!.toListValue(),
          )) {
            buffer.writeln(annotation);
          }
        }

        if (field.nullabilitySuffix == NullabilitySuffix.none) {
          buffer.write('required ');
        }
        final suffix =
            field.nullabilitySuffix == NullabilitySuffix.question ? '?' : '';
        buffer.writeln('${field.type}$suffix ${field.name},');
      }
      buffer.writeln('}) = _$generatedName;\n');
    } else {
      buffer.writeln('const $generatedName({');
      for (final field in fields.values) {
        if (field.nullabilitySuffix == NullabilitySuffix.none) {
          buffer.write('required ');
        }
        buffer.writeln('this.${field.name},');
      }
      buffer.writeln('});\n');
    }

    if (!includeFreezed) {
      for (final field in fields.values) {
        final suffix =
            field.nullabilitySuffix == NullabilitySuffix.question ? '?' : '';
        buffer.write('final ${field.type}$suffix ${field.name};');
      }
    }

    if (includeJsonSerialization) {
      buffer.writeln(
        'factory $generatedName.fromJson(Map<String, dynamic> json) => _\$${generatedName}FromJson(json);',
      );
    }

    buffer.write('}');

    return buffer.toString();
  }
}

List<String> _generateAnnotations(List<DartObject>? annotations) {
  if (annotations == null) return [];

  final result = <String>[];
  for (final annotation in annotations) {
    final type = annotation.type;
    final element = type?.element;
    if (type is! InterfaceType || element is! ClassElement) continue;

    final buffer = StringBuffer();
    buffer.writeln('@${element.name}(');

    for (final field in element.fields) {
      final reader = ConstantReader(annotation.getField(field.name));
      if (reader.isNull) continue;

      final value = _getValueFromReader(reader);
      if (element.constructors.any(
        (element) => element.parameters.any(
          (element) =>
              element.name == field.name &&
              element.isInitializingFormal &&
              element.isPositional,
        ),
      )) {
        buffer.writeln(
          '$value,',
        );
      } else {
        buffer.writeln(
          '${field.name}: $value,',
        );
      }
    }

    buffer.writeln(')');
    result.add(buffer.toString());
  }
  return result;
}

String _getValueFromReader(ConstantReader reader) {
  if (reader.objectValue.toFunctionValue() != null) {
    return reader.objectValue.toFunctionValue()!.name;
  }

  if (reader.objectValue.type?.element is EnumElement) {
    final enumName = reader.objectValue.type?.element?.name;
    final name = reader.objectValue.getField('_name')!.toStringValue()!;
    return '$enumName.$name';
  }

  return reader.objectValue
      .toString()
      .replaceAll(RegExp(r'^\w+\s*\('), '')
      .replaceAll(RegExp(r'\)$'), '');
}
