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
  apply: [
    MakePartial<User>(),
  ],
)
typedef UserProfile = $UserProfile;
