import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Container/Repositories/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: email,
              ),
              TextField(
                controller: password,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return TextButton(
                      onPressed: () {
                        ref.watch(authRepoProvider).login(
                            email.text.trim(), password.text.trim(), context);
                      },
                      child: const Text("Login"));
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
