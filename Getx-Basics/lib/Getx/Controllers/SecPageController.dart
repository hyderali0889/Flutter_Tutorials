// ignore_for_file: file_names

import 'package:get/get.dart';

class SecController extends GetxController {
  RxString name = "Ali".obs;

  changeName(String newName) {
    name.value = newName;
  }
}
