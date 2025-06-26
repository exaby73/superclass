final class $PR {
  const $PR();
}

final class _Superclass {
  const _Superclass();
}

final class Superclass {
  const Superclass({
    required this.apply,
    this.classAnnotations = const [],
    this.fieldAnnotations = const {},
    this.includeFreezed = false,
    this.includeJsonSerialization = false,
  });

  final List<_Superclass> apply;
  final List<Object> classAnnotations;
  final Map<String, List<Object>> fieldAnnotations;
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

final class Rename<First extends Object> extends _Superclass {
  const Rename({required this.fields});

  final Map<String, String> fields;
}

final class Intersect<First extends Object, Second extends Object>
    extends _Superclass {
  const Intersect();
}

final class Diff<First extends Object, Second extends Object>
    extends _Superclass {
  const Diff();
}

final class Transform<First extends Object> extends _Superclass {
  const Transform({required this.types});

  final Map<String, String> types;
}

final class WithDefaults<First extends Object> extends _Superclass {
  const WithDefaults({required this.defaults});

  final Map<String, String> defaults;
}
