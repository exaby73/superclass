import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';
import 'package:superclass_generator/src/utils/logger.dart';

Map<String, Field> required(
  Map<String, Field> fields,
  InterfaceType type,
  Set<String> applyTo,
) {
  final [first] = type.typeArguments;
  final firstElement = first.element;
  if (firstElement is! ClassElement) return fields;
  if (!typesAreDefined([firstElement])) {
    throw InvalidGenerationSourceError("Types for 'Required' must be defined.");
  }

  final firstFields = firstElement.name == '\$PR'
      ? fields
      : firstElement.fields.validMappedFields;

  if (applyTo.isEmpty) {
    applyTo.addAll(firstFields.keys);
  }

  for (final MapEntry(key: name, value: field) in firstFields.entries) {
    if (!applyTo.contains(name)) continue;
    fields[name] = field.copyWith(
      nullabilitySuffix: NullabilitySuffix.none,
    );
  }

  return fields;
}
