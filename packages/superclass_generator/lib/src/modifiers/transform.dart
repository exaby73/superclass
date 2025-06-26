import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';

Map<String, Field> transform(
  Map<String, Field> fields,
  InterfaceType type,
  Map<String, String> typeMap,
) {
  final [first] = type.typeArguments;
  final firstElement = first.element;
  if (firstElement is! ClassElement) return fields;
  if (!typesAreDefined([firstElement])) {
    throw InvalidGenerationSourceError("Types for 'Transform' must be defined.");
  }

  final firstFields = firstElement.validMappedFieldsOrFields(fields);
  final result = <String, Field>{};
  
  for (final entry in firstFields.entries) {
    final fieldName = entry.key;
    final field = entry.value;
    final newType = typeMap[fieldName];
    
    if (newType != null) {
      // Transform the type
      result[fieldName] = Field(
        name: fieldName,
        type: newType,
        // Preserve nullability if the new type doesn't already include it
        nullabilitySuffix: newType.contains('?') 
            ? NullabilitySuffix.none 
            : field.nullabilitySuffix,
      );
    } else {
      // Keep the original field
      result[fieldName] = field;
    }
  }
  
  return result;
}