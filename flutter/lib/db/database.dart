import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;
  static const _authTable = 'auths';
  static const _accessToken = 'access_token';
  static const _firstName = 'first_name';
  static const _secondName = 'second_name';
  static const _role = 'role';
  static const _photoId = 'photo_id';
  static const _email = 'email';
  static const _phone = 'phone';
  Future<Database> get database async => _database ??= await _initDB();

   Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}autotinder.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_authTable(id INTEGER PRIMARY KEY AUTOINCREMENT, $_accessToken TEXT,$_firstName TEXT,$_secondName TEXT,$_role TEXT,$_photoId TEXT,$_email TEXT,$_phone TEXT)');
  }

  Future<DBUser?> getDBUser() async {
    Database db = await database;
    final List<Map<String, dynamic>> usersMapList = await db.query(_authTable);
    if(usersMapList.isEmpty){
      return null;
    }
    return DBUser.fromMap(usersMapList.first);
  }

  Future<DBUser> insertUser(DBUser user) async {
    Database db = await database;
    user.id = await db.insert(_authTable, user.toMap());
    return user;
  }

  Future<int> updateAuth(DBUser user) async {
    Database db = await database;
    return await db.update(_authTable, user.toMap(),
        where: 'id=?', whereArgs: [user.id]);
  }

  Future<int> deleteAuth(int? id) async {
    Database db = await database;
    return await db.delete(_authTable, where: 'id=?', whereArgs: [id]);
  }
}