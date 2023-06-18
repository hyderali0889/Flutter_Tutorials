// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/HomeController.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  var controo = Get.put(HomeController());

  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controo.fetch();

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controo) {
          if (controo.products.isNotEmpty) {
            print(controo.products[0][0]["id"]);
            return const Text("Hello");
          } else {
            return CircularProgressIndicator();
          }
        });

    // if (controo.products.isNotEmpty) {
    //   print(controo.products);

    //   return Column(children: const [
    //     Text("hello")

    //     // Text("${controo.number}")),
    //     // TextButton(
    //     //     onPressed: () {
    //     //       controo.inc();
    //     //     },
    //     //     child: const Text("Increases")
    //   ]);
    // } else {
    //   return CircularProgressIndicator();
    // }
  }
}
