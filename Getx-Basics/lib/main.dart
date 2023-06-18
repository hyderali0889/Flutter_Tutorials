import 'package:flutter/material.dart';
import 'package:flutter_getx/Getx/Bindings/Main_Binding.dart';
import 'package:flutter_getx/pages/HomePage.dart';
import 'package:get/get.dart';

void main() {
  MainBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePage(),
    );
  }
}
