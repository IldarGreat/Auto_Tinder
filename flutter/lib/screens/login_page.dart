import 'package:flutter/material.dart';
import 'package:front/widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hidePass = true;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(25),
            children: [
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Войти',
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
                height: 60,
              ),
              TextFormField(
                 controller: _loginController,
                maxLength: 12,
                decoration: const InputDecoration(
                  labelText: 'Логин',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите логин';
                  }
                  if (value.length < 4) {
                    return 'Размер логина не менее 4 символов';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                 controller: _passwordController,
                maxLength: 12,
                obscureText: _hidePass,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                    icon: _hidePass
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 4) {
                    return 'Размер пароля не менее 4 символов';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: enterButton('Вход',_loginController.text,_passwordController.text, context,_formKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
