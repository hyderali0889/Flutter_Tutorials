import 'package:flutter/material.dart';
import 'package:flutter_providers/pages/Homepage.dart';
import 'package:flutter_providers/pages/Secondpage.dart';
import 'package:flutter_providers/providers/Home_provider.dart';
import 'package:flutter_providers/providers/second_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( 
    MultiProvider(providers: [ 
      ChangeNotifierProvider(create:(_) => HomeProvider()),
      ChangeNotifierProvider(create:(_) => SecondProvider()),
     ] ,child: const MyApp(),
     ));
     
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      initialRoute: "/",
      routes: { 
        "/" : (context) =>const HomePage(),
        '/second': (context) =>const Secondpage(),
       } ,
     );
  }
}