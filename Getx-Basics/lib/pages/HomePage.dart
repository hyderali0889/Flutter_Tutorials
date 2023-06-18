// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_getx/Getx/Controllers/SecPageController.dart';
import 'package:flutter_getx/pages/PageTwo.dart';
import 'package:get/get.dart';

import '../Getx/Controllers/HomePageController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Obx(
          () => Column(
            children: [
              Text(
                Get.find<SecController>().name.value,
                style: TextStyle(fontSize: 120),
              ),
              Text(
                "${Get.find<HomePageController>().count}",
                style: TextStyle(fontSize: 120),
              ),
            ],
          ),
        ),
          TextButton(
            onPressed: () {
              Get.find<HomePageController>().increment();
            },
            child: const Text("Increment"),
          ),
          TextButton(
            onPressed: () {
              Get.find<SecController>().changeName("Bro");
            },
            child: const Text("Decrement"),
          ),
          TextButton(
            onPressed: () {
              Get.to(PageTwo());
            },
            child: const Text("Go To Page 2"),
          )
        ],
      ),
    );
  }
}
