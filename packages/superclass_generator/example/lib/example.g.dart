// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String,
      age: (json['age'] as num?)?.toInt(),
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'profile': instance.profile,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'bio': instance.bio,
    };

_$$UserProfileImpl _$$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$$UserProfileImpl(
      name: json['name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$$UserProfileImplToJson(_$$UserProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'profile': instance.profile,
    };

_$$UserRegistrationFormImpl _$$$UserRegistrationFormImplFromJson(
        Map<String, dynamic> json) =>
    _$$UserRegistrationFormImpl(
      name: json['name'] as String?,
      street: json['street'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$$UserRegistrationFormImplToJson(
        _$$UserRegistrationFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'city': instance.city,
      'country': instance.country,
    };
