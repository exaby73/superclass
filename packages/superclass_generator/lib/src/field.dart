import 'package:analyzer/dart/element/nullability_suffix.dart';

class Field {
  const Field({
    required this.name,
    required this.type,
    required this.nullabilitySuffix,
    this.defaultValue,
  });

  final String name;
  final String type;
  final NullabilitySuffix nullabilitySuffix;
  final String? defaultValue;

  Field copyWith({
    String? name,
    String? type,
    NullabilitySuffix? nullabilitySuffix,
    String? defaultValue,
  }) {
    return Field(
      name: name ?? this.name,
      type: type ?? this.type,
      nullabilitySuffix: nullabilitySuffix ?? this.nullabilitySuffix,
      defaultValue: defaultValue ?? this.defaultValue,
    );
  }
}
