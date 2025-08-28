import 'package:analyzer/dart/element/element2.dart';
import 'package:superclass_generator/src/field.dart';

bool isValidField(FormalParameterElement field) {
  return !field.isStatic && !field.isPrivate && !field.isSynthetic;
}

bool typesAreDefined(List<ClassElement2> elements) {
  return elements.every((element) => element.name3 != 'Object');
}

extension ListFieldElementExtension on List<ConstructorElement2> {
  Map<String, Field> get validMappedFields {
    return Map.fromEntries(
      first.formalParameters.where(isValidField).map((field) {
        return MapEntry(
          field.name3!,
          Field(
            name: field.name3!,
            type: field.type.getDisplayString(),
            nullabilitySuffix: field.type.nullabilitySuffix,
          ),
        );
      }),
    );
  }
}

extension ClassElementExtension on ClassElement2 {
  Map<String, Field> validMappedFieldsOrFields(Map<String, Field> fields) {
    return name3 == '\$PR' ? fields : constructors2.validMappedFields;
  }
}
