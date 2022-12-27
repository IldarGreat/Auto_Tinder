import 'package:flutter/material.dart';
import 'package:front/api/auth_api.dart';
import 'package:front/db/database.dart';
import 'package:front/models/user.dart';

import 'utils.dart';

Widget button(String text, dynamic context) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
          //  side: const BorderSide(color: Color.fromARGB(255, 255, 255, 123)),
        ),
      ),
    ),
    onPressed: () {
      if (text == 'Войти') {
        Navigator.pushNamed(context, '/login');
      }
      if (text == 'Зарегистрироваться') {
        Navigator.pushNamed(context, '/register');
      }
    },
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontStyle: FontStyle.italic,
        // color: Colors.purple
      ),
    ),
  );
}

Widget enterButton(String text, String login, String password, dynamic context,
    GlobalKey<FormState> key) {
      print('ds2a');
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
      ),
    ),
    onPressed: () {
      print('ds2a');
      if (key.currentState!.validate()) {
        AuthApi().login(login, password).then((value) {
          if (value != null) {
            print('dsa');
            DBProvider.db.insertUser(value);
            Navigator.pushReplacementNamed(context, '/personal_page');
          } else {
            errorBar(
                'Проверьте корректность ведденных данных, либо подтвердите почту',
                context);
          }
        });
      }
    },
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}

Widget registerButton(
    String text,
    String login,
    String firstName,
    String secondName,
    String story,
    String phone,
    String email,
    String password,
    DateTime dateOfBirth,
    dynamic context,
    GlobalKey<FormState> key) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
      ),
    ),
    onPressed: () {
      if (key.currentState!.validate()) {
        if ((DateTime.now().year - dateOfBirth.year) < 18) {
          errorBar('Тебе должно быть больше 18 лет', context);
        } else {
          String date =
              '${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}';
          UserRequest user = UserRequest(login, password, firstName, secondName,
              story, email, date, phone);
          AuthApi().register(user, context).then((value) {
            if (value == 'Перейдите по активационной ссылке на почте') {
              Navigator.pop(context);
              errorBar(value, context);
            } else {
              errorBar(value, context);
            }
          });
        }
      }
    },
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}

Widget imageButton(
        {required String title,
        required IconData icon,
        required VoidCallback onClicked}) =>
    ElevatedButton(
        onPressed: onClicked,
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(title)
          ],
        ));
