import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:superclass_generator/src/generator.dart';

Builder superclassBuilder(BuilderOptions options) {
  return SharedPartBuilder([SuperclassGenerator()], 'superclass');
}
