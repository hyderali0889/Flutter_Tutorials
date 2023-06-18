// ignore_for_file: file_names

import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt count = 0.obs;
  RxString name = "ali".obs;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  void changeName(String secName) {
    name.value = secName;
  }
}
