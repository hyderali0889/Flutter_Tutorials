// ignore_for_file: file_names

import 'package:get/get.dart';

import '../Controllers/HomePageController.dart';
import '../Controllers/SecPageController.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<SecController>(() => SecController());
  }
}
