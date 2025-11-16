import 'package:analyzer/dart/element/element.dart';
import 'package:superclass_generator/src/field.dart';

bool isValidField(FormalParameterElement field) {
  return !field.isStatic && !field.isPrivate && !field.isSynthetic;
}

bool typesAreDefined(List<ClassElement> elements) {
  return elements.every((element) => element.name != 'Object');
}

extension ListFieldElementExtension on List<ConstructorElement> {
  Map<String, Field> get validMappedFields {
    return Map.fromEntries(
      first.formalParameters.where(isValidField).map((field) {
        return MapEntry(
          field.name!,
          Field(
            name: field.name!,
            type: field.type.getDisplayString(),
            nullabilitySuffix: field.type.nullabilitySuffix,
          ),
        );
      }),
    );
  }
}

extension ClassElementExtension on ClassElement {
  Map<String, Field> validMappedFieldsOrFields(Map<String, Field> fields) {
    return name == '\$PR' ? fields : constructors.validMappedFields;
  }
}
