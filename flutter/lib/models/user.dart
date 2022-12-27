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
}
