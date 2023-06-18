import 'package:flutter/material.dart';
import 'package:obj_box/Screens/Home_Screen.dart';
import 'Helper/ObjectBoxHelper.dart';

late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();

  // Please Disable the windows defender's real time protection if errors occurs
  // during running on windows

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
