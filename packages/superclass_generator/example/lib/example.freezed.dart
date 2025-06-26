// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({String name, int? age, Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = freezed,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int? age, Profile profile});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = freezed,
    Object? profile = null,
  }) {
    return _then(_$UserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({required this.name, this.age, required this.profile});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String name;
  @override
  final int? age;
  @override
  final Profile profile;

  @override
  String toString() {
    return 'User(name: $name, age: $age, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, age, profile);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String name,
      final int? age,
      required final Profile profile}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get name;
  @override
  int? get age;
  @override
  Profile get profile;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String get bio => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call({String bio});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = null,
  }) {
    return _then(_value.copyWith(
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bio});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = null,
  }) {
    return _then(_$ProfileImpl(
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl({required this.bio});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String bio;

  @override
  String toString() {
    return 'Profile(bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bio);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile({required final String bio}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String get bio;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

$UserProfile _$$UserProfileFromJson(Map<String, dynamic> json) {
  return _$UserProfile.fromJson(json);
}

/// @nodoc
mixin _$$UserProfile {
  String? get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;

  /// Serializes this $UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of $UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $$UserProfileCopyWith<$UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $$UserProfileCopyWith<$Res> {
  factory $$UserProfileCopyWith(
          $UserProfile value, $Res Function($UserProfile) then) =
      _$$UserProfileCopyWithImpl<$Res, $UserProfile>;
  @useResult
  $Res call({String? name, int? age, Profile? profile});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$$UserProfileCopyWithImpl<$Res, $Val extends $UserProfile>
    implements $$UserProfileCopyWith<$Res> {
  _$$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of $UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ) as $Val);
  }

  /// Create a copy of $UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$UserProfileImplCopyWith<$Res>
    implements $$UserProfileCopyWith<$Res> {
  factory _$$$UserProfileImplCopyWith(
          _$$UserProfileImpl value, $Res Function(_$$UserProfileImpl) then) =
      __$$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? age, Profile? profile});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$$UserProfileImplCopyWithImpl<$Res>
    extends _$$UserProfileCopyWithImpl<$Res, _$$UserProfileImpl>
    implements _$$$UserProfileImplCopyWith<$Res> {
  __$$$UserProfileImplCopyWithImpl(
      _$$UserProfileImpl _value, $Res Function(_$$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of $UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$$UserProfileImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$UserProfileImpl implements _$UserProfile {
  const _$$UserProfileImpl({this.name, this.age, this.profile});

  factory _$$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$$UserProfileImplFromJson(json);

  @override
  final String? name;
  @override
  final int? age;
  @override
  final Profile? profile;

  @override
  String toString() {
    return '\$UserProfile(name: $name, age: $age, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$UserProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, age, profile);

  /// Create a copy of $UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$UserProfileImplCopyWith<_$$UserProfileImpl> get copyWith =>
      __$$$UserProfileImplCopyWithImpl<_$$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _$UserProfile implements $UserProfile {
  const factory _$UserProfile(
      {final String? name,
      final int? age,
      final Profile? profile}) = _$$UserProfileImpl;

  factory _$UserProfile.fromJson(Map<String, dynamic> json) =
      _$$UserProfileImpl.fromJson;

  @override
  String? get name;
  @override
  int? get age;
  @override
  Profile? get profile;

  /// Create a copy of $UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$UserProfileImplCopyWith<_$$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

$UserRegistrationForm _$$UserRegistrationFormFromJson(
    Map<String, dynamic> json) {
  return _$UserRegistrationForm.fromJson(json);
}

/// @nodoc
mixin _$$UserRegistrationForm {
  String? get name => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  /// Serializes this $UserRegistrationForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of $UserRegistrationForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $$UserRegistrationFormCopyWith<$UserRegistrationForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $$UserRegistrationFormCopyWith<$Res> {
  factory $$UserRegistrationFormCopyWith($UserRegistrationForm value,
          $Res Function($UserRegistrationForm) then) =
      _$$UserRegistrationFormCopyWithImpl<$Res, $UserRegistrationForm>;
  @useResult
  $Res call({String? name, String street, String city, String country});
}

/// @nodoc
class _$$UserRegistrationFormCopyWithImpl<$Res,
        $Val extends $UserRegistrationForm>
    implements $$UserRegistrationFormCopyWith<$Res> {
  _$$UserRegistrationFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of $UserRegistrationForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? street = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$UserRegistrationFormImplCopyWith<$Res>
    implements $$UserRegistrationFormCopyWith<$Res> {
  factory _$$$UserRegistrationFormImplCopyWith(
          _$$UserRegistrationFormImpl value,
          $Res Function(_$$UserRegistrationFormImpl) then) =
      __$$$UserRegistrationFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String street, String city, String country});
}

/// @nodoc
class __$$$UserRegistrationFormImplCopyWithImpl<$Res>
    extends _$$UserRegistrationFormCopyWithImpl<$Res,
        _$$UserRegistrationFormImpl>
    implements _$$$UserRegistrationFormImplCopyWith<$Res> {
  __$$$UserRegistrationFormImplCopyWithImpl(_$$UserRegistrationFormImpl _value,
      $Res Function(_$$UserRegistrationFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of $UserRegistrationForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? street = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_$$UserRegistrationFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$UserRegistrationFormImpl implements _$UserRegistrationForm {
  const _$$UserRegistrationFormImpl(
      {this.name,
      required this.street,
      required this.city,
      required this.country});

  factory _$$UserRegistrationFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$$UserRegistrationFormImplFromJson(json);

  @override
  final String? name;
  @override
  final String street;
  @override
  final String city;
  @override
  final String country;

  @override
  String toString() {
    return '\$UserRegistrationForm(name: $name, street: $street, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$UserRegistrationFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, street, city, country);

  /// Create a copy of $UserRegistrationForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$UserRegistrationFormImplCopyWith<_$$UserRegistrationFormImpl>
      get copyWith => __$$$UserRegistrationFormImplCopyWithImpl<
          _$$UserRegistrationFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$UserRegistrationFormImplToJson(
      this,
    );
  }
}

abstract class _$UserRegistrationForm implements $UserRegistrationForm {
  const factory _$UserRegistrationForm(
      {final String? name,
      required final String street,
      required final String city,
      required final String country}) = _$$UserRegistrationFormImpl;

  factory _$UserRegistrationForm.fromJson(Map<String, dynamic> json) =
      _$$UserRegistrationFormImpl.fromJson;

  @override
  String? get name;
  @override
  String get street;
  @override
  String get city;
  @override
  String get country;

  /// Create a copy of $UserRegistrationForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$UserRegistrationFormImplCopyWith<_$$UserRegistrationFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$$AnonymousUser {
  String get userName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;

  /// Create a copy of $AnonymousUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $$AnonymousUserCopyWith<$AnonymousUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $$AnonymousUserCopyWith<$Res> {
  factory $$AnonymousUserCopyWith(
          $AnonymousUser value, $Res Function($AnonymousUser) then) =
      _$$AnonymousUserCopyWithImpl<$Res, $AnonymousUser>;
  @useResult
  $Res call({String userName, int? age});
}

/// @nodoc
class _$$AnonymousUserCopyWithImpl<$Res, $Val extends $AnonymousUser>
    implements $$AnonymousUserCopyWith<$Res> {
  _$$AnonymousUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of $AnonymousUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$AnonymousUserImplCopyWith<$Res>
    implements $$AnonymousUserCopyWith<$Res> {
  factory _$$$AnonymousUserImplCopyWith(_$$AnonymousUserImpl value,
          $Res Function(_$$AnonymousUserImpl) then) =
      __$$$AnonymousUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, int? age});
}

/// @nodoc
class __$$$AnonymousUserImplCopyWithImpl<$Res>
    extends _$$AnonymousUserCopyWithImpl<$Res, _$$AnonymousUserImpl>
    implements _$$$AnonymousUserImplCopyWith<$Res> {
  __$$$AnonymousUserImplCopyWithImpl(
      _$$AnonymousUserImpl _value, $Res Function(_$$AnonymousUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of $AnonymousUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? age = freezed,
  }) {
    return _then(_$$AnonymousUserImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$$AnonymousUserImpl implements _$AnonymousUser {
  const _$$AnonymousUserImpl({this.userName = 'Anonymous', this.age = 0});

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final int? age;

  @override
  String toString() {
    return '\$AnonymousUser(userName: $userName, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$AnonymousUserImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.age, age) || other.age == age));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, age);

  /// Create a copy of $AnonymousUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$AnonymousUserImplCopyWith<_$$AnonymousUserImpl> get copyWith =>
      __$$$AnonymousUserImplCopyWithImpl<_$$AnonymousUserImpl>(
          this, _$identity);
}

abstract class _$AnonymousUser implements $AnonymousUser {
  const factory _$AnonymousUser({final String userName, final int? age}) =
      _$$AnonymousUserImpl;

  @override
  String get userName;
  @override
  int? get age;

  /// Create a copy of $AnonymousUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$AnonymousUserImplCopyWith<_$$AnonymousUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
