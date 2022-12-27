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
              colors: [Colors.blue, Colors.purple]),
        ),
        child: ListView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black54,
            ),
            label: "Обмен",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.black54,
            ),
            label: "Подборка",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black54,
            ),
            label: "Подписка",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Colors.black54,
            ),
            label: "Сообщения",
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
        selectedItemColor: Colors.black54,
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