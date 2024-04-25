import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/generator.dart';

Builder superclassBuilder(BuilderOptions options) {
  return PartBuilder(
    [SuperclassGenerator()],
    '.superclass.dart',
    header: '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
        '// ignore_for_file: invalid_annotation_target',
  );
}
