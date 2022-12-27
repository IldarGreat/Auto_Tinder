import 'package:flutter/material.dart';

Widget button(String text,dynamic context) {
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

Widget enterButton(String text,String login,String password,dynamic context,GlobalKey<FormState> key) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
      ),
    ),
    onPressed: () {
     if(key.currentState!.validate()){
      print('Все норм!');
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
