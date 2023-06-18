import 'package:flutter/material.dart';
import 'package:flutter_fire/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fire/pages/second.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Homepage(),
        "/second" : (context) => const Second()
      },
    );
  }
}
