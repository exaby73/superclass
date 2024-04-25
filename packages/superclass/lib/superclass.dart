final class $PR {
  const $PR();
}

final class _Superclass {
  const _Superclass();
}

final class Superclass {
  const Superclass({
    required this.apply,
    this.annotations = const {},
    this.includeFreezed = false,
    this.includeJsonSerialization = false,
  });

  final List<_Superclass> apply;
  final Map<String, List<Object>> annotations;
  final bool includeFreezed;
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

final class MakePartial<First extends Object> extends _Superclass {
  const MakePartial({this.onlyFields = const {}});

  final Set<String> onlyFields;
}

final class Pick<First extends Object> extends _Superclass {
  const Pick({required this.fields});

  final Set<String> fields;
}

final class MakeRequired<First extends Object> extends _Superclass {
  const MakeRequired({this.onlyFields = const {}});

  final Set<String> onlyFields;
}
