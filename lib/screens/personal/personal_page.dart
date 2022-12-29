import 'package:flutter/material.dart';
import 'package:front/db/database.dart';
import 'package:front/models/user.dart';
import 'package:front/widgets/buttons.dart';

import '../../widgets/utils.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  DBUser? user = DBUser(0, '', '', '', '', '', '', '');
  @override
  void initState() {
    super.initState();
    DBProvider.db.getDBUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: user!.photoId == ''
                  ? const NetworkImage(
                      'https://www.clipartmax.com/png/middle/364-3643767_about-brent-kovacs-user-profile-placeholder.png')
                  : NetworkImage(user!.photoId),
              radius: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${user!.firstName}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.settings),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/change_user_page');
                  },
                  icon: const Icon(Icons.border_color),
                  iconSize: 30,
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.local_car_wash),
                  iconSize: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text(
                'Личная информация',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
              ),
              subtitle: Text(
                'Имя:${user!.firstName}\nФамилия:${user!.secondName}\nПочта:${user!.email}\nТелефон:${user!.phone}',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/my_likes');
                },
                child: const Text(
                  'Управление подписками',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    // color: Colors.purple
                  ),
                ),
              ),
            ),
            logout(context),
          ],
        ),
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
        currentIndex: 4,
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
      case 3:
        Navigator.pushReplacementNamed(context, '/messages');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/my_likes');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/compilation');
        break;
    }
  }
}
