// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => TextButton(
              child: Text("$count"),
              onPressed: () {
                count++;
              },
            )),
        TextButton(
          child: const Text("Go To Page two"),
          onPressed: () {
            Get.toNamed("/second" , arguments: "Ali");
          },
        ),
      ],
    );
  }

  // void snackbar() {
  //   // Get.snackbar("Example", "Dont Touch ME",
  //   //     backgroundColor: Colors.red,
  //   //     duration: const Duration(seconds: 3),
  //   //     borderRadius: 14.0,
  //   //     colorText: Colors.white,
  //   //     snackPosition: SnackPosition.BOTTOM);

  //   Get.dialog(AlertDialog(
  //     title:const Text("Book You"),
  //     actions: [
  //       TextButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: const Text("X"))
  //     ],
  //   ));
  // }
}
