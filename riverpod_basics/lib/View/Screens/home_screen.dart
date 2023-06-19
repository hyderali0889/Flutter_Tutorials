import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_basics/Container/Repositories/auth_repository.dart';

import '../../Container/Pods/home_pods.dart';
import '../Routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Consumer(
          builder: (context, ref, child) {
            String text = ref.watch(bingoProvider) ?? "";

            var auth = ref.watch(authRepoProvider);

            return Column(
              children: [
                Text("Home $text ${FirebaseAuth.instance.currentUser!.uid}"),
                TextButton(
                    onPressed: () {
                      ref
                          .read(bingoProvider.notifier)
                          .update((state) => "Bingo ${Random().nextInt(10)}");
                    },
                    child: const Text("press")),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes().second,
                          pathParameters: {"dat": text});
                    },
                    child: const Text("Go to Sec")),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes().future);
                    },
                    child: const Text("Go to Future")),
                TextButton(
                    onPressed: () {
                      auth.singOut();
                      context.goNamed(Routes().login);
                    },
                    child: const Text("LogOut"))
              ],
            );
          },
        ),
      )),
    );
  }
}
