import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompilationPage extends StatefulWidget {
  const CompilationPage({super.key});

  @override
  State<CompilationPage> createState() => _CompilationPageState();
}

class _CompilationPageState extends State<CompilationPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.purple, Colors.blue]),
        ),
        child: ListView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black54,
            ),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.black54,
            ),
            label: "События",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black54,
            ),
            label: "Личный кабинет",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Colors.black54,
            ),
            label: "События",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.black54,
            ),
            label: "Личный кабинет",
          )
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: _onTappedBar,
      ),
    );
  }

  void _onTappedBar(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/change_page');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/messages');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/personal_page');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/my_likes');
        break;
    }
   }
}