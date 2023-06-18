import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/FetchApi.dart';

class HomeController extends GetxController {
  var number = 1.obs;
  var products = [].obs;

  void inc() {
    number.value++;
  }

  fetch() {
    getData();
  print("Fecthing started");

   }

  void getData() async {
    try {
      var Pro = await Fetch().fetchData();
      if (Pro != null) {
   products.add(Pro);  
   update();     
        // print(products);
      }
    } catch (e) {
      print(e);
    }
  }
}
