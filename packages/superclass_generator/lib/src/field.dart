import 'package:analyzer/dart/element/nullability_suffix.dart';

class Field {
  const Field({
    required this.name,
    required this.type,
    required this.nullabilitySuffix,
  });

  final String name;
  final String type;
  final NullabilitySuffix nullabilitySuffix;

  Field copyWith({
    String? name,
    String? type,
    NullabilitySuffix? nullabilitySuffix,
  }) {
    return Field(
      name: name ?? this.name,
      type: type ?? this.type,
      nullabilitySuffix: nullabilitySuffix ?? this.nullabilitySuffix,
    );
  }
}
