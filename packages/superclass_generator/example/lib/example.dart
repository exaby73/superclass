import 'package:superclass/superclass.dart';

part 'example.g.dart';

class User {
  const User(this.name, this.age);

  final String name;
  final int age;
}

class Profile {
  const Profile(this.bio);

  final String bio;
}

@Superclass(
  apply: [
    Merge<User, String>(),
    Omit<$PR>(fields: {'bio'}),
  ],
)
typedef UserProfile = $UserProfile;
