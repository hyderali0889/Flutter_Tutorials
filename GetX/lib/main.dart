import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/Home.dart';
import 'Pages/Second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp( 
      initialRoute: "/",
      getPages: [ 
        GetPage(name: "/", page: () =>const Home()),
        GetPage(name: "/second", page: () =>const Second()),
       ],
     );
  }
}
