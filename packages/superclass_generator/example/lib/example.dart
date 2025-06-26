import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superclass/superclass.dart';

part 'example.freezed.dart';

part 'example.superclass.dart';

part 'example.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    int? age,
    required Profile profile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Profile with _$Profile {
  const factory Profile({required String bio}) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@Superclass(
  includeFreezed: true,
  includeJsonSerialization: true,
  classAnnotations: [Freezed()],
  apply: [
    MakePartial<User>(),
  ],
)
typedef UserProfile = $UserProfile;

// Example: Omit fields then make remaining optional
@Superclass(
  apply: [
    Omit<User>(fields: {'profile'}), // Step 1: Remove profile field
    MakePartial<$PR>(), // Step 2: Make remaining fields (id, name, age) optional
  ],
)
typedef PublicUserUpdate = $PublicUserUpdate;

// Example: Pick fields then make them required
@Superclass(
  apply: [
    Pick<User>(fields: {'name', 'age'}), // Step 1: Keep only name and age
    MakeRequired<$PR>(), // Step 2: Make both fields required (age was optional)
  ],
)
typedef RequiredUserInfo = $RequiredUserInfo;

// Example: Complex chaining with merge
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
  includeFreezed: true,
  includeJsonSerialization: true,
  apply: [
    Omit<User>(fields: {'profile', 'age'}), // Step 1: Remove profile and age
    MakePartial<$PR>(onlyFields: {'name'}), // Step 2: Make only name optional
    Merge<$PR, Address>(), // Step 3: Add address fields
    MakeRequired<$PR>(onlyFields: {'street', 'city'}), // Step 4: Make address fields required
  ],
)
typedef UserRegistrationForm = $UserRegistrationForm;

// Example: Rename fields for API compatibility
@Superclass(
  apply: [
    Rename<User>(fields: {
      'name': 'displayName',
      'age': 'userAge',
    }),
  ],
)
typedef UserApiDto = $UserApiDto;

// Example: Find common fields between two types
class Employee {
  final String name;
  final int age;
  final String department;
  final String position;
  
  const Employee({
    required this.name,
    required this.age,
    required this.department,
    required this.position,
  });
}

@Superclass(
  apply: [
    Intersect<User, Employee>(), // Only name and age (common fields)
  ],
)
typedef CommonUserEmployee = $CommonUserEmployee;

// Example: Extract User-specific fields (not in Employee)
@Superclass(
  apply: [
    Diff<User, Employee>(), // Only profile field (User has but Employee doesn't)
  ],
)
typedef UserSpecificFields = $UserSpecificFields;

// Example: Transform field types for JSON serialization
@Superclass(
  apply: [
    Transform<User>(types: {
      'age': 'String', // int -> String for JSON
      'name': 'String', // Keep as String (no change)
    }),
  ],
)
typedef UserJsonDto = $UserJsonDto;

// Example: Complex chaining with new utilities
@Superclass(
  apply: [
    Pick<User>(fields: {'name', 'age', 'profile'}), // Step 1: Pick specific fields
    Transform<$PR>(types: {'age': 'String'}), // Step 2: Transform age to String
    Rename<$PR>(fields: {'name': 'fullName'}), // Step 3: Rename name to fullName
    MakePartial<$PR>(onlyFields: {'profile'}), // Step 4: Make profile optional
  ],
)
typedef ComplexUserTransform = $ComplexUserTransform;

// Example: Employee-User intersection then transformation
@Superclass(
  apply: [
    Intersect<Employee, User>(), // Step 1: Common fields (name, age)
    Transform<$PR>(types: {'age': 'String'}), // Step 2: Transform age to String
    Rename<$PR>(fields: {'name': 'personName'}), // Step 3: Rename name
  ],
)
typedef PersonInfo = $PersonInfo;

// Example: WithDefaults - Add default values to fields
@Superclass(
  apply: [
    WithDefaults<User>(defaults: {
      'name': "'Guest User'",
      'age': '18',
    }),
  ],
)
typedef UserWithDefaults = $UserWithDefaults;

// Example: Pick fields then add defaults
@Superclass(
  apply: [
    Pick<Employee>(fields: {'name', 'department', 'position'}),
    WithDefaults<$PR>(defaults: {
      'department': "'General'",
      'position': "'Staff'",
    }),
  ],
)
typedef EmployeeWithDefaults = $EmployeeWithDefaults;

// Example: Complex chain with defaults at the end
@Superclass(
  includeFreezed: true,
  apply: [
    Omit<User>(fields: {'profile'}), // Step 1: Remove profile
    Rename<$PR>(fields: {'name': 'userName'}), // Step 2: Rename name
    WithDefaults<$PR>(defaults: {
      'userName': "'Anonymous'",
      'age': '0',
    }), // Step 3: Add defaults
  ],
)
typedef AnonymousUser = $AnonymousUser;
