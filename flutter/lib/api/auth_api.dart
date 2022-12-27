import 'dart:convert';

import 'package:front/models/user.dart';
import 'package:front/widgets/utils.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
class AuthApi{
   Future<String> register(UserRequest user,context) async {
    final response = await http.post(
      Uri.parse(
          '${Constants.AUTOTINDER_BASE_SCHEMA}${Constants.AUTOTINDER_BASE_URL_DOMAIN}${Constants.AUTOTINDER_AUTH_PATH}/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    errorBar('Пожалуйста подождите', context);
    if (response.statusCode == 201) {
      return 'Перейдите по активационной ссылке на почте';
    } else {
      return 'Регистрация не прошла, произошла ошибка';
    }
  }

  Future<DBUser?> login(String login, String password) async {
    final response = await http.post(
      Uri.parse(
          '${Constants.AUTOTINDER_BASE_SCHEMA}${Constants.AUTOTINDER_BASE_URL_DOMAIN}${Constants.AUTOTINDER_AUTH_PATH}/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'login': login, 'password': password}),
    );
    if (response.statusCode == 200) {
      return DBUser.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}