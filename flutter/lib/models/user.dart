import 'dart:math';

class DBUser {
  late int? id;
  late String? accessToken;
  late String? firstName;
  late String? secondName;
  late String? role;
  late String? photoId;

  DBUser(this.id, this.accessToken, this.firstName, this.secondName, this.role,
      this.photoId);

  DBUser.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    accessToken = map['access_token'];
    firstName = map['first_name'];
    secondName = map['second_name'];
    role = map['role'];
    photoId = map['photo_id'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['access_token'] = accessToken;
    map['first_name'] = firstName;
    map['second_name'] = secondName;
    map['role'] = role;
    map['photo_id'] = photoId;
    return map;
  }

  factory DBUser.fromJson(Map<String, dynamic> json) {
    return DBUser(
        Random().nextInt(100),
        json['accessToken'] as String,
        json['firstName'] as String,
        json['secondName'] as String,
        json['role'] as String,
        json['photoId'] as String);
  }
}

class UserRequest {
  late String? login;
  late String? password;
  late String? firstName;
  late String? secondName;
  late String? lifeStory;
  late String? email;
  late String? dateOfBirth;
  late String? phoneNumber;

  UserRequest(this.login, this.password, this.firstName, this.secondName,
      this.lifeStory, this.email, this.dateOfBirth, this.phoneNumber);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'password': password,
        'firstName': firstName,
        'secondName': secondName,
        'lifeStory': lifeStory,
        'email': email,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
      };
}
