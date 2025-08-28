// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: invalid_annotation_target

part of 'example.dart';

// **************************************************************************
// SuperclassGenerator
// **************************************************************************

@freezed
@Freezed(addImplicitFinal: true, genericArgumentFactories: false)
abstract class $UserProfile with _$$UserProfile {
  const factory $UserProfile({String? name, int? age, Profile? profile}) =
      _$UserProfile;

  factory $UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileFromJson(json);
}

class $PublicUserUpdate {
  const $PublicUserUpdate({this.name, this.age});

  final String? name;
  final int? age;
}

class $RequiredUserInfo {
  const $RequiredUserInfo({required this.name, required this.age});

  final String name;
  final int age;
}

@freezed
abstract class $UserRegistrationForm with _$$UserRegistrationForm {
  const factory $UserRegistrationForm({
    String? name,
    required String street,
    required String city,
    required String country,
  }) = _$UserRegistrationForm;

  factory $UserRegistrationForm.fromJson(Map<String, dynamic> json) =>
      _$$UserRegistrationFormFromJson(json);
}

class $UserApiDto {
  const $UserApiDto({
    required this.displayName,
    this.userAge,
    required this.profile,
  });

  final String displayName;
  final int? userAge;
  final Profile profile;
}

class $CommonUserEmployee {
  const $CommonUserEmployee({required this.name, this.age});

  final String name;
  final int? age;
}

class $UserSpecificFields {
  const $UserSpecificFields({required this.profile});

  final Profile profile;
}

class $UserJsonDto {
  const $UserJsonDto({required this.name, this.age, required this.profile});

  final String name;
  final String? age;
  final Profile profile;
}

class $ComplexUserTransform {
  const $ComplexUserTransform({required this.fullName, this.age, this.profile});

  final String fullName;
  final String? age;
  final Profile? profile;
}

class $PersonInfo {
  const $PersonInfo({required this.personName, required this.age});

  final String personName;
  final String age;
}

class $UserWithDefaults {
  const $UserWithDefaults({
    this.name = 'Guest User',
    this.age = 18,
    required this.profile,
  });

  final String name;
  final int? age;
  final Profile profile;
}

class $EmployeeWithDefaults {
  const $EmployeeWithDefaults({
    required this.name,
    this.department = 'General',
    this.position = 'Staff',
  });

  final String name;
  final String department;
  final String position;
}

@freezed
abstract class $AnonymousUser with _$$AnonymousUser {
  const factory $AnonymousUser({
    @Default('Anonymous') String userName,
    @Default(0) int? age,
  }) = _$AnonymousUser;
}
