## 0.6.0

- **FEAT**: Update dependencies

## 0.5.0

- **FEAT**: Add `Rename<T>` utility type for field renaming with API compatibility
- **FEAT**: Add `Intersect<T1, T2>` utility type to keep only common fields between types
- **FEAT**: Add `Diff<T1, T2>` utility type to extract fields unique to the first type
- **FEAT**: Add `Transform<T>` utility type for field type transformation (useful for serialization)
- **FEAT**: Add `WithDefaults<T>` utility type to add default values to fields
- **FEAT**: Automatic Freezed support for `WithDefaults` - uses `@Default()` annotations
- **FEAT**: Enhanced chaining capabilities with all new utilities supporting `$PR`
- **FEAT**: Comprehensive documentation and examples for all new utility types

## 0.1.0

> Note: This release has breaking changes.

- **BREAKING** **FEAT**: add support for class level annotations.

## 0.0.1

- Initial release
