import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';

Map<String, Field> pick(
  Map<String, Field> fields,
  InterfaceType type,
  Set<String> fieldsToPick,
) {
  final [first] = type.typeArguments;
  final firstElement = first.element;
  if (firstElement is! ClassElement) return fields;
  if (!typesAreDefined([firstElement])) {
    throw InvalidGenerationSourceError("Types for 'Pick' must be defined.");
  }

  final firstFields = firstElement.name == '\$PR'
      ? fields
      : firstElement.validMappedFieldsOrFields(fields);

  final result = <String, Field>{};
  for (final MapEntry(key: name, value: field) in firstFields.entries) {
    if (!fieldsToPick.contains(name)) continue;
    result[name] = field;
  }

  return result;
}
