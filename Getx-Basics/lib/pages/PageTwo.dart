// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_getx/Getx/Controllers/HomePageController.dart';
import 'package:flutter_getx/Getx/Controllers/SecPageController.dart';
import 'package:get/get.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Go Back",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
