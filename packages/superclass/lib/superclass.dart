final class $PR {
  const $PR();
}

final class _Superclass {
  const _Superclass();
}

final class Superclass {
  const Superclass({
    required this.apply,
    this.includeFreezed = false,
    this.includeDartMappable = false,
    this.includeJsonSerialization = false,
  });

  final List<_Superclass> apply;
  final bool includeFreezed;
  final bool includeDartMappable;
  final bool includeJsonSerialization;
}

final class Merge<First extends Object, Second extends Object>
    extends _Superclass {
  const Merge();
}

final class Omit<First extends Object> extends _Superclass {
  const Omit({required this.fields});

  final Set<String> fields;
}

final class Partial<First extends Object> extends _Superclass {
  const Partial({this.onlyFields = const {}});

  final Set<String> onlyFields;
}

final class Pick<First extends Object> extends _Superclass {
  const Pick({required this.fields});

  final Set<String> fields;
}
