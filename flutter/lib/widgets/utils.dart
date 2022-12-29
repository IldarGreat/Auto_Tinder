import 'package:flutter/material.dart';

import '../db/database.dart';
import '../models/user.dart';
import '../screens/main_page.dart';

void errorBar(String text, dynamic context) {
  final snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: 'Понял',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

 ElevatedButton logout(dynamic context) {
    return ElevatedButton(
      onPressed: () {
        logoutAndDeleteAuth(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
            //side: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
      child: const Text(
        'Выйти из аккаунта',
        style: TextStyle(color: Colors.redAccent),
      ),
    );
  }

  void logoutAndDeleteAuth(dynamic context) async {
    DBUser? auth = await DBProvider.db.getDBUser();
    DBProvider.db.deleteAuth(auth?.id);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }
