import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/Container/Pods/home_pods.dart';
import 'package:riverpod_basics/View/Screens/home_screen.dart';
import 'package:riverpod_basics/View/Screens/login_screen.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(authStreamProvider).when(data: (data) {
      if (data != null) {
        return const HomeScreen();
      }

      return const LoginScreen();
    }, error: ((error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }), loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
