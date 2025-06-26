# Superclass

[![pub package](https://img.shields.io/pub/v/superclass.svg)](https://pub.dev/packages/superclass)

Superclass brings TypeScript Utility Types to Dart, providing powerful type transformations through code generation. Create variations of existing types without manual duplication, with full support for Freezed and JSON serialization.

## Features

- 🎯 **TypeScript-like utility types**: `Omit`, `Pick`, `MakePartial`, `MakeRequired`, `Merge`, `Rename`, `Intersect`, `Diff`, `Transform`, `WithDefaults`
- 🔗 **Chainable operations**: Use `$PR` (Previous Result) to apply multiple transformations
- ❄️ **Freezed integration**: Generate freezed classes with all immutability benefits
- 📦 **JSON serialization**: Built-in support for json_serializable
- 🚀 **Type-safe**: Full static type checking and IDE support

## Installation

Add Superclass to your `pubspec.yaml`:

```yaml
dependencies:
  superclass: ^0.1.0

dev_dependencies:
  build_runner: ^2.4.0
  superclass_generator: ^0.1.0
```

## Quick Start

1. Create a simple type transformation:

```dart
import 'package:superclass/superclass.dart';

part 'user.superclass.dart';

class User {
  final String id;
  final String name;
  final String email;
  final DateTime? lastLogin;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.lastLogin,
  });
}

// Create a version without sensitive fields
@Superclass(
  apply: [
    Omit<User>(fields: {'email', 'lastLogin'}),
  ],
)
typedef PublicUser = $PublicUser;

// Create a version with all fields optional
@Superclass(
  apply: [
    MakePartial<User>(),
  ],
)
typedef PartialUser = $PartialUser;
```

2. Run code generation:

```bash
dart run build_runner build
```

3. Use the generated types:

```dart
void main() {
  // Original type requires all fields
  final user = User(
    id: '123',
    name: 'John Doe',
    email: 'john@example.com',
  );

  // Generated type only has id and name
  final publicUser = PublicUser(
    id: user.id,
    name: user.name,
  );

  // All fields are optional
  final partialUser = PartialUser(
    name: 'Jane',
  );
}
```

## Core Utility Types

### Omit\<T\>

Creates a type by omitting specified fields from T.

```dart
@Superclass(
  apply: [
    Omit<User>(fields: {'password', 'email'}),
  ],
)
typedef SafeUser = $SafeUser;
```

### Pick\<T\>

Creates a type by picking only specified fields from T.

```dart
@Superclass(
  apply: [
    Pick<User>(fields: {'id', 'name'}),
  ],
)
typedef UserSummary = $UserSummary;
```

### MakePartial\<T\>

Makes all fields optional, or only specified fields if `onlyFields` is provided.

```dart
@Superclass(
  apply: [
    MakePartial<User>(), // All fields optional
  ],
)
typedef OptionalUser = $OptionalUser;

@Superclass(
  apply: [
    MakePartial<User>(onlyFields: {'email', 'phone'}), // Only email and phone optional
  ],
)
typedef UserWithOptionalContact = $UserWithOptionalContact;
```

### MakeRequired\<T\>

Makes all fields required, or only specified fields if `onlyFields` is provided.

```dart
@Superclass(
  apply: [
    MakeRequired<Profile>(), // All fields required
  ],
)
typedef CompleteProfile = $CompleteProfile;

@Superclass(
  apply: [
    MakeRequired<Profile>(onlyFields: {'bio', 'avatar'}), // Only bio and avatar required
  ],
)
typedef ProfileWithRequiredInfo = $ProfileWithRequiredInfo;
```

### Merge\<T1, T2\>

Creates a type by merging two types together. Fields from T2 override fields from T1.

```dart
class Address {
  final String street;
  final String city;
  final String country;
  
  const Address({
    required this.street,
    required this.city,
    required this.country,
  });
}

@Superclass(
  apply: [
    Merge<User, Address>(),
  ],
)
typedef UserWithAddress = $UserWithAddress;
```

### Rename\<T\>

Renames fields using a mapping for API compatibility.

```dart
@Superclass(
  apply: [
    Rename<User>(fields: {
      'name': 'displayName',
      'email': 'emailAddress',
    }),
  ],
)
typedef UserApiDto = $UserApiDto;
```

### Intersect\<T1, T2\>

Creates a type with only the fields that exist in both types.

```dart
class Employee {
  final String name;
  final int age;
  final String department;
  final String position;
}

@Superclass(
  apply: [
    Intersect<User, Employee>(), // Only name and age (common fields)
  ],
)
typedef CommonFields = $CommonFields;
```

### Diff\<T1, T2\>

Creates a type with fields that exist in T1 but not in T2.

```dart
@Superclass(
  apply: [
    Diff<User, Employee>(), // Fields unique to User
  ],
)
typedef UserSpecificFields = $UserSpecificFields;
```

### Transform\<T\>

Transforms field types using a mapping, useful for serialization.

```dart
@Superclass(
  apply: [
    Transform<User>(types: {
      'age': 'String', // int -> String for JSON APIs
      'createdAt': 'String', // DateTime -> String
    }),
  ],
)
typedef UserJsonDto = $UserJsonDto;
```

### WithDefaults\<T\>

Adds default values to fields, automatically handling Freezed vs regular classes.

```dart
@Superclass(
  apply: [
    WithDefaults<User>(defaults: {
      'name': "'Guest User'",
      'age': '18',
    }),
  ],
)
typedef UserWithDefaults = $UserWithDefaults;
// Result: name defaults to 'Guest User', age defaults to 18

// Works with Freezed too - automatically uses @Default() annotation
@Superclass(
  includeFreezed: true,
  apply: [
    WithDefaults<Profile>(defaults: {
      'bio': "'No bio provided'",
    }),
  ],
)
typedef ProfileWithDefaults = $ProfileWithDefaults;
// Result: @Default('No bio provided') String bio,
```

## Advanced: Chaining Operations with $PR

The `$PR` (Previous Result) type enables powerful operation chaining. Each operation in the `apply` list can reference the result of the previous operation.

### Example: Omit then MakePartial

```dart
// Start with a User class
class User {
  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
  });
}

// First omit sensitive fields, then make remaining fields optional
@Superclass(
  apply: [
    Omit<User>(fields: {'email', 'isAdmin'}), // Step 1: Remove email and isAdmin
    MakePartial<$PR>(), // Step 2: Make id and name optional
  ],
)
typedef PublicUserUpdate = $PublicUserUpdate;

// Result: A type with only optional id and name fields
final update = PublicUserUpdate(name: 'New Name'); // id is optional
```

### Example: Pick then MakeRequired

```dart
class Profile {
  final String? bio;
  final String? avatar;
  final String? website;
  final DateTime? birthDate;
  
  const Profile({
    this.bio,
    this.avatar,
    this.website,
    this.birthDate,
  });
}

// Pick certain fields and make them all required
@Superclass(
  apply: [
    Pick<Profile>(fields: {'bio', 'avatar'}), // Step 1: Keep only bio and avatar
    MakeRequired<$PR>(), // Step 2: Make both fields required
  ],
)
typedef RequiredProfileInfo = $RequiredProfileInfo;

// Result: A type with required bio and avatar fields
final info = RequiredProfileInfo(
  bio: 'Software Developer', // Required
  avatar: 'avatar.jpg', // Required
);
```

### Example: Complex Multi-Step Transformation

```dart
@Superclass(
  apply: [
    Pick<User>(fields: {'name', 'age', 'email'}), // Step 1: Pick specific fields
    Transform<$PR>(types: {'age': 'String'}), // Step 2: Transform age to String
    Rename<$PR>(fields: {'name': 'fullName'}), // Step 3: Rename name to fullName
    MakePartial<$PR>(onlyFields: {'email'}), // Step 4: Make email optional
  ],
)
typedef ComplexUserTransform = $ComplexUserTransform;
// Result: fullName (String), age (String), email (String?)

// Advanced: Pick, add defaults, then make some optional
@Superclass(
  apply: [
    Pick<Employee>(fields: {'name', 'department', 'position'}), // Step 1: Pick fields
    WithDefaults<$PR>(defaults: {
      'department': "'General'",
      'position': "'Staff'",
    }), // Step 2: Add defaults
    MakePartial<$PR>(onlyFields: {'name'}), // Step 3: Make name optional
  ],
)
typedef FlexibleEmployee = $FlexibleEmployee;
// Result: name (String?), department (String = 'General'), position (String = 'Staff')
```

## Freezed Integration

Superclass seamlessly integrates with Freezed for immutable classes:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superclass/superclass.dart';

part 'models.freezed.dart';
part 'models.superclass.dart';
part 'models.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    @Default(false) bool isVerified,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// Generate a Freezed class with transformed fields
@Superclass(
  includeFreezed: true,
  includeJsonSerialization: true,
  classAnnotations: [Freezed()],
  apply: [
    Omit<User>(fields: {'email'}),
    MakePartial<$PR>(),
  ],
)
typedef PublicUserDto = $PublicUserDto;
```

## JSON Serialization

Enable JSON serialization for generated types:

```dart
@Superclass(
  includeJsonSerialization: true,
  apply: [
    Pick<User>(fields: {'id', 'name', 'avatar'}),
  ],
)
typedef UserSummaryJson = $UserSummaryJson;

// Use the generated fromJson/toJson methods
final json = {'id': '123', 'name': 'John', 'avatar': 'avatar.jpg'};
final summary = UserSummaryJson.fromJson(json);
final backToJson = summary.toJson();
```

## Custom Annotations

Add custom class and field annotations:

```dart
@Superclass(
  classAnnotations: [
    JsonSerializable(explicitToJson: true),
    MyCustomAnnotation(),
  ],
  fieldAnnotations: {
    'createdAt': [JsonKey(name: 'created_at')],
    'updatedAt': [JsonKey(name: 'updated_at')],
  },
  apply: [
    Pick<Post>(fields: {'id', 'title', 'createdAt', 'updatedAt'}),
  ],
)
typedef PostMetadata = $PostMetadata;
```

## Build Configuration

The generator runs before other generators to ensure proper integration. In your `build.yaml`:

```yaml
builders:
  superclass_generator:
    runs_before:
      - freezed
      - json_serializable
```

## Best Practices

1. **Use meaningful type names**: Choose descriptive names that indicate the transformation's purpose
2. **Chain operations thoughtfully**: Each operation should have a clear purpose in the chain
3. **Document complex transformations**: Add comments explaining multi-step transformations
4. **Leverage type safety**: The generated types provide full compile-time checking

## API Reference

### @Superclass Annotation

| Parameter | Type | Description |
|-----------|------|-------------|
| `apply` | `List<_Superclass>` | List of transformations to apply (required) |
| `includeFreezed` | `bool` | Generate Freezed classes (default: false) |
| `includeJsonSerialization` | `bool` | Include JSON serialization (default: false) |
| `classAnnotations` | `List<Object>` | Annotations to add to generated class |
| `fieldAnnotations` | `Map<String, List<Object>>` | Per-field annotations |

### Utility Types

| Type | Description | Parameters |
|------|-------------|------------|
| `Omit<T>` | Remove specified fields | `fields`: Set of field names to omit |
| `Pick<T>` | Keep only specified fields | `fields`: Set of field names to keep |
| `MakePartial<T>` | Make fields optional | `onlyFields`: Optional set to make only specific fields optional |
| `MakeRequired<T>` | Make fields required | `onlyFields`: Optional set to make only specific fields required |
| `Merge<T1, T2>` | Merge two types | None (T2 fields override T1) |
| `Rename<T>` | Rename fields | `fields`: Map of old name to new name |
| `Intersect<T1, T2>` | Keep common fields only | None (fields that exist in both types) |
| `Diff<T1, T2>` | Keep fields unique to T1 | None (fields in T1 but not in T2) |
| `Transform<T>` | Transform field types | `types`: Map of field name to new type |
| `WithDefaults<T>` | Add default values to fields | `defaults`: Map of field name to default value |
| `$PR` | Reference previous result | None (use in apply chain) |

## License

See LICENSE file for details.