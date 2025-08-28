import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/field.dart';
import 'package:superclass_generator/src/utils/helpers.dart';

Map<String, Field> partial(
  Map<String, Field> fields,
  InterfaceType type,
  Set<String> applyTo,
) {
  final [first] = type.typeArguments;
  final firstElement = first.element3;
  if (firstElement is! ClassElement2) return fields;
  if (!typesAreDefined([firstElement])) {
    throw InvalidGenerationSourceError("Types for 'Partial' must be defined.");
  }

  final firstFields = firstElement.name3 == '\$PR'
      ? fields
      : firstElement.validMappedFieldsOrFields(fields);

  if (applyTo.isEmpty) {
    applyTo.addAll(firstFields.keys);
  }

  for (final MapEntry(key: name, value: field) in firstFields.entries) {
    if (!applyTo.contains(name)) continue;
    fields[name] = field.copyWith(
      nullabilitySuffix: NullabilitySuffix.question,
    );
  }

  return fields;
}
