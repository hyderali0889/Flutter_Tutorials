// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:obj_box/main.dart';
import '../Models/UserModel.dart';
import '../objectbox.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Box<User> box = objectBox.store.box<User>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isdatathere = box.count() != 0 ? true : false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          isdatathere
              ? Text(
                  "${box.get(3)?.email}",
                  style: TextStyle(color: Colors.white),
                )
              : Text("Nothing Found" , style: TextStyle(color: Colors.white),),
          TextField(
            controller: emailController,
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            controller: passwordController,
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                User model = User(email: email, password: password);
                setState(() {
                  isdatathere = true;
                });
                box.put(model);
              },
              child: const Text("Hello"))
        ],
      ),
    );
  }
}
