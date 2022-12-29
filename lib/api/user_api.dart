import 'dart:convert';

import 'package:front/models/user.dart';
import 'package:front/widgets/utils.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class UserApi {
  Future<UserResponse?> patch(String firstName, String secondName, 
      String phoneNumber, String? accessToken) async {
    final response = await http.patch(
      Uri.parse(
          '${Constants.AUTOTINDER_BASE_SCHEMA}${Constants.AUTOTINDER_BASE_URL_DOMAIN}${Constants.AUTOTINDER_USER_PATH}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'autoTinderJWT=$accessToken'
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName,
        'secondName': secondName,
        'phoneNumber': phoneNumber,
      }),
    );
    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

Future<String> changeSubscription(String role,String? accessToken) async {
  print(role);
  print(accessToken);
    final response = await http.post(
      Uri.parse(
          '${Constants.AUTOTINDER_BASE_SCHEMA}${Constants.AUTOTINDER_BASE_URL_DOMAIN}${Constants.AUTOTINDER_USER_PATH}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      //  'Cookie': 'autoTinderJWT=$accessToken'
      },
      body: 'role',
    );
    print(response.statusCode);
    if (response.statusCode == 204) {
      return 'Подписка изменена';
    } else {
       return 'Произошла ошибка';
    }
  }
  
}
