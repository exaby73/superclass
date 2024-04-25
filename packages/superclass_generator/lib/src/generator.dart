import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass/superclass.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/modifiers/merge.dart';
import 'package:superclass_generator/src/modifiers/omit.dart';
import 'package:superclass_generator/src/utils/logger.dart';

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
      includeFreezed,
      includeDartMappable,
      includeJsonSerialization,
    ) = (
      annotation.read('apply').listValue,
      annotation.read('includeFreezed').boolValue,
      annotation.read('includeDartMappable').boolValue,
      annotation.read('includeJsonSerialization').boolValue,
    );

    if (apply.isEmpty) {
      throw InvalidGenerationSourceError(
        '`apply` must not be empty.',
        element: element,
      );
    }

    final buffer = StringBuffer();
    Map<String, Field> fields = <String, Field>{};

    buffer.write('class \$${element.name} {');

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

    buffer.writeln('const \$${element.name}({');
    for (final field in fields.values) {
      buffer.writeln('required this.${field.name},');
    }
    buffer.writeln('});');

    for (final field in fields.values) {
      buffer.write('final ${field.type} ${field.name};');
    }

    buffer.write('}');

    return buffer.toString();
  }
}
