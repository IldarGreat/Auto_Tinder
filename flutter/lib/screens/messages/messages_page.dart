import 'package:flutter/material.dart';
import 'package:front/widgets/utils.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        onTap: _onTappedBar,
      ),
    );
  }

   void _onTappedBar(int index) {
    switch (index) {
      case 1:
        Navigator.pushReplacementNamed(context, '/change_page');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/compilation');
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