import 'package:flutter/material.dart';
import 'package:front/screens/auth/login_page.dart';
import 'package:front/screens/auth/register_page.dart';
import 'package:front/screens/change/change_page.dart';
import 'package:front/screens/compilation/compilation_page.dart';
import 'package:front/screens/messages/messages_page.dart';
import 'package:front/screens/personal/personal_page.dart';
import 'package:front/screens/sub/my_likes.dart';

import 'screens/main_page.dart';
import 'package:flutter/services.dart';

import 'screens/personal/change_user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
  runApp(
    MaterialApp(
        home: const MainPage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (context) => const LoginPage());

            case '/register':
              return MaterialPageRoute(builder: (context) => const RegisterPage());

            case '/personal_page':
              return MaterialPageRoute(builder: (context) => const PersonalPage());

            case '/messages':
              return MaterialPageRoute(builder: (context) => const MessagesPage());

            case '/my_likes':
              return MaterialPageRoute(builder: (context) => const MyLikes());

            case '/compilation':
              return MaterialPageRoute(builder: (context) => const CompilationPage());

            case '/change_page':
              return MaterialPageRoute(builder: (context) => const ChangePage());

            case '/change_user_page':
              return MaterialPageRoute(builder: (context) => const ChangeUserPage());
          }
        }),
  );
}
