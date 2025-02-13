import 'package:flutter/gestures.dart';

class UserProfile {
  final String name;
  final String nickName;
  final String birthday;
  final Gender gender;
  final String? licenseUri;

  //  {this.licenseUri}를 넣음으로서 licenseUri의 데이터는 선택적으로 할 수 있음
  UserProfile(this.name, this.nickName, this.birthday, this.gender, {this.licenseUri});

  @override
  String toString() {
    return 'UserProfile{name: $name, nickName: $nickName, birthday: $birthday, gender: $gender}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfile &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          nickName == other.nickName &&
          birthday == other.birthday &&
          gender == other.gender;

  @override
  int get hashCode =>
      name.hashCode ^ nickName.hashCode ^ birthday.hashCode ^ gender.hashCode;
}

enum Gender {
    FEMALE, MALE
}