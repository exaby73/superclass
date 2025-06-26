import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';

Map<String, Field> withDefaults(
  Map<String, Field> fields,
  InterfaceType type,
  Map<String, String> defaults,
) {
  final [first] = type.typeArguments;
  final firstElement = first.element;
  if (firstElement is! ClassElement) return fields;
  if (!typesAreDefined([firstElement])) {
    throw InvalidGenerationSourceError("Types for 'WithDefaults' must be defined.");
  }

  final firstFields = firstElement.validMappedFieldsOrFields(fields);
  final result = <String, Field>{};
  
  for (final entry in firstFields.entries) {
    final fieldName = entry.key;
    final field = entry.value;
    final defaultValue = defaults[fieldName];
    
    result[fieldName] = field.copyWith(defaultValue: defaultValue);
  }
  
  return result;
}