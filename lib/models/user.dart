import 'dart:math';

class DBUser {
  late int? id;
  late String? accessToken;
  late String? firstName;
  late String? secondName;
  late String? role;
  late String photoId;
  late String? email;
  late String? phone;

  DBUser(this.id, this.accessToken, this.firstName, this.secondName, this.role,
      this.photoId, this.email, this.phone);

  DBUser.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    accessToken = map['access_token'];
    firstName = map['first_name'];
    secondName = map['second_name'];
    role = map['role'];
    photoId = map['photo_id'];
    email = map['email'];
    phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['access_token'] = accessToken;
    map['first_name'] = firstName;
    map['second_name'] = secondName;
    map['role'] = role;
    map['photo_id'] = photoId;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

  factory DBUser.fromJson(Map<String, dynamic> json) {
    return DBUser(
        Random().nextInt(100),
        json['accessToken'] as String,
        json['firstName'] as String,
        json['secondName'] as String,
        json['role'] as String,
        json['photoId'] as String,
        json['email'] as String,
        json['phone'] as String);
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

class UserResponse {
  late String? id;
  late String? login;
  late String? role;
  late String? firstName;
  late String? secondName;
  late String? lifeStory;
  late String? email;
  late String? dateOfBirth;
  late String? phoneNumber;

  UserResponse(this.id, this.login, this.role, this.firstName, this.secondName,
      this.lifeStory, this.email, this.dateOfBirth, this.phoneNumber);

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        json['id'] as String,
        json['login'] as String,
        json['role'] as String,
        json['firstName'] as String,
        json['secondName'] as String,
        json['lifeStory'] as String,
        json['email'] as String,
        json['dateOfBirth'] as String,
        json['phoneNumber'] as String);
  }
}
