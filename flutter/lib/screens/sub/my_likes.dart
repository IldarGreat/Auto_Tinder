import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyLikes extends StatefulWidget {
  const MyLikes({super.key});

  @override
  State<MyLikes> createState() => _MyLikesState();
}

class _MyLikesState extends State<MyLikes> {
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
        currentIndex: 2,
        selectedItemColor: Colors.black54,
        onTap: _onTappedBar,
      ),
    );
  }

  void _onTappedBar(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/change_page');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/compilation');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/messages');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/personal_page');
        break;
    }
  }
}
