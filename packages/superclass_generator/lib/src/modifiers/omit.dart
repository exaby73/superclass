import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';

Map<String, Field> omit(
  Map<String, Field> fields,
  InterfaceType type,
  Set<String> fieldsToOmit,
) {
  final [first] = type.typeArguments;
  final firstElement = first.element3;
  if (firstElement is! ClassElement2) return fields;
  if (!typesAreDefined([firstElement])) {
    throw InvalidGenerationSourceError("Types for 'Omit' must be defined.");
  }

  final firstFields = firstElement.name3 == '\$PR'
      ? fields
      : firstElement.validMappedFieldsOrFields(fields);

  final result = <String, Field>{};
  for (final MapEntry(key: name, value: field) in firstFields.entries) {
    if (fieldsToOmit.contains(name)) continue;
    result[name] = field;
  }

  return result;
}
