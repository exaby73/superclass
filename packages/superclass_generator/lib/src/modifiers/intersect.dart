import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';

Map<String, Field> intersect(Map<String, Field> fields, InterfaceType type) {
  final [first, second] = type.typeArguments;
  final (firstElement, secondElement) = (first.element3, second.element3);
  if (firstElement is! ClassElement2 || secondElement is! ClassElement2) {
    return fields;
  }
  if (!typesAreDefined([firstElement, secondElement])) {
    throw InvalidGenerationSourceError(
        "Types for 'Intersect' must be defined.");
  }

  final (firstFields, secondFields) = (
    firstElement.validMappedFieldsOrFields(fields),
    secondElement.validMappedFieldsOrFields(fields),
  );

  final result = <String, Field>{};

  for (final entry in firstFields.entries) {
    final fieldName = entry.key;
    if (secondFields.containsKey(fieldName)) {
      // Keep the field from the first type
      result[fieldName] = entry.value;
    }
  }

  return result;
}
