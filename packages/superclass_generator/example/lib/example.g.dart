// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  name: json['name'] as String,
  age: (json['age'] as num?)?.toInt(),
  profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
  'profile': instance.profile,
};

_Profile _$ProfileFromJson(Map<String, dynamic> json) =>
    _Profile(bio: json['bio'] as String);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'bio': instance.bio,
};

_$UserProfile _$$UserProfileFromJson(Map<String, dynamic> json) =>
    _$UserProfile(
      name: json['name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileToJson(_$UserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'profile': instance.profile,
    };

_$UserRegistrationForm _$$UserRegistrationFormFromJson(
  Map<String, dynamic> json,
) => _$UserRegistrationForm(
  name: json['name'] as String?,
  street: json['street'] as String,
  city: json['city'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$$UserRegistrationFormToJson(
  _$UserRegistrationForm instance,
) => <String, dynamic>{
  'name': instance.name,
  'street': instance.street,
  'city': instance.city,
  'country': instance.country,
};
