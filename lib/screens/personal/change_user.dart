import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/db/database.dart';
import 'package:front/models/user.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/buttons.dart';

class ChangeUserPage extends StatefulWidget {
  const ChangeUserPage({super.key});

  @override
  State<ChangeUserPage> createState() => _ChangeUserPageState();
}

class _ChangeUserPageState extends State<ChangeUserPage> {
  final _firstNameController = TextEditingController(text: '');
  final _secondNameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  DateTime dateOfBirth = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  File? image;
  DBUser? user;
  @override
  void initState() {
    super.initState();
    DBProvider.db.getDBUser().then((value) {
      user = value;
      setState(() {
        _firstNameController.text = value!.firstName!;
        _secondNameController.text = value.secondName!;
        _phoneController.text = value.phone!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    _phoneController.dispose();
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
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
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Изменить \nинформацию \nо себе',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              image != null
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage: Image.file(
                        image!,
                      ).image,
                    )
                  : const CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://www.clipartmax.com/png/middle/364-3643767_about-brent-kovacs-user-profile-placeholder.png'),
                    ),
              imageButton(
                  title: 'Выбрать фотографию',
                  icon: Icons.image_outlined,
                  onClicked: () => pickImage()),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: patchButton(
                    'Изменить',
                    user,
                    _firstNameController.text,
                    _secondNameController.text,
                    _phoneController.text,
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
}
