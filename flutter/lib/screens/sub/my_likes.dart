import 'package:flutter/material.dart';
import 'package:front/db/database.dart';
import 'package:front/models/user.dart';
import 'package:front/widgets/buttons.dart';

class MyLikes extends StatefulWidget {
  const MyLikes({super.key});

  @override
  State<MyLikes> createState() => _MyLikesState();
}

class _MyLikesState extends State<MyLikes> {
  DBUser? user;
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
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: ListView(
            children: [
              Card(
                color: Colors.purple,
                child: ListTile(
                  leading: Image.network(
                      'https://cdn4.iconfinder.com/data/icons/font-awesome-2/2048/f046-1024.png'),
                  title: user == null
                      ? const Text('')
                      : Text(
                          '${user!.role}',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                  subtitle: const Text(
                    'Обычная подписка дает тебе самые базовые возможности использования приложения',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: Color.fromARGB(236, 130, 56, 250),
                child: ListTile(
                  leading: Image.network(
                      'https://cdn4.iconfinder.com/data/icons/font-awesome-2/2048/f046-1024.png'),
                  title: const Text(
                    'PLUS',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: title(
                      'Подписка PLUS позволяет ставит лайки без ограничений',
                      'PLUS'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: Colors.yellow,
                child: ListTile(
                  leading: Image.network(
                      'https://cdn4.iconfinder.com/data/icons/font-awesome-2/2048/f046-1024.png'),
                  title: const Text(
                    'GOLD',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: title(
                      'Подписка PLUS позволит вам выставлять на продажу и обмен сразу несколько авто',
                      'GOLD'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: Colors.brown,
                child: ListTile(
                  leading: Image.network(
                      'https://cdn4.iconfinder.com/data/icons/font-awesome-2/2048/f046-1024.png'),
                  title: const Text(
                    'PLATINUM',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle:  title(
                      'Подписка PLATINUM объединяет все предыдущие подписки, а также позволит просматривать всех лайкнувших вас пользователей',
                      'PLATINUM'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
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

  Widget title(String text, String type) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Подключить',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}
