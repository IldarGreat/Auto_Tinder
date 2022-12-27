import 'package:flutter/material.dart';
import 'package:front/screens/login_page.dart';

import 'screens/main_page.dart';
import 'package:flutter/services.dart';

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
          }
        }),
  );
}
