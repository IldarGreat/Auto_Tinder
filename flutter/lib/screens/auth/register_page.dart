import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _hidePass = true;
  bool _hideAnotherPass = true;
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _anotherPasswordController = TextEditingController();
  final _storyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _loginController = TextEditingController();
  DateTime dateOfBirth = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  File? image;
  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _anotherPasswordController.dispose();
    _storyController.dispose();
    _phoneController.dispose();
    _loginController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue]),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Регистрация',
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
              const CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://www.clipartmax.com/png/middle/364-3643767_about-brent-kovacs-user-profile-placeholder.png'),
                    ),
              TextFormField(
                controller: _loginController,
                maxLength: 25,
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
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _firstNameController,
                maxLength: 25,
                decoration: const InputDecoration(
                  labelText: 'Имя',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _secondNameController,
                maxLength: 25,
                decoration: const InputDecoration(
                  labelText: 'Фамилия',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите фамилию';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _storyController,
                maxLength: 25,
                decoration: const InputDecoration(
                  labelText: 'О себе',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Расскажите о себе';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                maxLength: 25,
                decoration: const InputDecoration(
                  labelText: 'Почта',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите почту';
                  }
                  if (!value.contains('@')) {
                    return 'Некорректная почта';
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _anotherPasswordController,
                maxLength: 12,
                obscureText: _hideAnotherPass,
                decoration: InputDecoration(
                  labelText: 'Подвердите пароль',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hideAnotherPass = !_hideAnotherPass;
                      });
                    },
                    icon: _hideAnotherPass
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value != _passwordController.text) {
                    return 'Пароли не совпадают!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneController,
                maxLength: 12,
                decoration: const InputDecoration(
                  labelText: 'Номер телефона',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите свой номер';
                  }
                  if (!value.contains('+7')) {
                    return 'Введите номер в формате +7';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Дата рождения ${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              editDate(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: registerButton(
                    'Зарегистрироваться',
                    _loginController.text,
                    _firstNameController.text,
                    _secondNameController.text,
                    _storyController.text,
                    _phoneController.text,
                    _emailController.text,
                    _passwordController.text,
                    dateOfBirth,
                    context,
                    _formKey,
                    image),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton editDate() {
    return ElevatedButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: dateOfBirth,
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          if (newDate != null) {
            setState(() {
              dateOfBirth = newDate;
            });
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
              side: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
        child: const Text(
          'Изменить дату рождения',
          style: TextStyle(color: Colors.white),
        ));
  }
}
