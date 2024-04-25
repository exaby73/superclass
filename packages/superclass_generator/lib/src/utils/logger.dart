@Deprecated("Use for debugging purposes only")
void debug(Object? object) {
  final stackTrace = StackTrace.current;
  var file = stackTrace.toString().split('\n')[1].split(' ').last.trim();
  file = file.substring(1, file.length - 1);

  final buffer = StringBuffer();
  buffer.writeln('-' * 20);
  buffer.writeln(file);
  buffer.writeln(object);
  buffer.writeln('-' * 20);

  print(buffer.toString());
}
