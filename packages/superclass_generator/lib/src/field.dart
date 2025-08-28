import 'package:analyzer/dart/element/nullability_suffix.dart';

class Field {
  Field({
    required this.name,
    required String type,
    NullabilitySuffix? nullabilitySuffix,
    this.defaultValue,
  }) {
    final isNull = type.endsWith('?');
    this.type = type.replaceAll('?', '');
    this.nullabilitySuffix = nullabilitySuffix ??
        (isNull ? NullabilitySuffix.question : NullabilitySuffix.none);
  }

  final String name;
  late final String type;
  final String? defaultValue;
  late final NullabilitySuffix nullabilitySuffix;

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
