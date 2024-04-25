import 'package:analyzer/dart/element/element.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/logger.dart';

bool isValidField(FieldElement field) {
  return !field.isStatic &&
      !field.isPrivate &&
      !field.isSynthetic &&
      !field.isAbstract;
}

bool typesAreDefined(List<ClassElement> elements) {
  return elements.every((element) => element.name != 'Object');
}

extension ListFieldElementExtension on List<FieldElement> {
  Map<String, Field> get validMappedFields {
    return Map.fromEntries(
      where(isValidField).map((field) {
        return MapEntry(
          field.name,
          Field(
            name: field.name,
            type: field.type.getDisplayString(withNullability: false),
            nullabilitySuffix: field.type.nullabilitySuffix,
          ),
        );
      }),
    );
  }
}

extension ClassElementExtension on ClassElement {
  Map<String, Field> validMappedFieldsOrFields(Map<String, Field> fields) {
    return name == '\$PR' ? fields : this.fields.validMappedFields;
  }
}
