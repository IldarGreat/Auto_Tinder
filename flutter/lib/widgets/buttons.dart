import 'package:flutter/material.dart';

Widget button(String text) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        //  side: const BorderSide(color: Color.fromARGB(255, 255, 255, 123)),
        ),
      ),
    ),
    onPressed: () {},
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
