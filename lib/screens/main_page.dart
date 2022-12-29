import 'package:flutter/material.dart';
import 'package:front/db/database.dart';

import '../widgets/buttons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    DBProvider.db.getDBUser().then((value) {
      if (value != null) {
        Navigator.pushReplacementNamed(context, '/personal_page');
      }else{
        print("We dont have user");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue]),
        ),
        child: ListView(
          padding: const EdgeInsets.all(25.0),
          children: [
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Auto Tinder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            button('Войти',context),
            const SizedBox(
              height: 25,
            ),
            button('Зарегистрироваться',context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Проблемы со входом?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
