import 'package:flutter/material.dart';

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

void onTappedNavigationBar(int index,dynamic context){
  
}
