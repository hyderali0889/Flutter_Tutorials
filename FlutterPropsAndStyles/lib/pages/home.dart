import 'package:flutter/material.dart';
import '../components/first.dart';
import '../components/stless.dart';
import '../styles/homestyle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var hello = Styles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(
          "Hello",
          style: hello.hometext(),
        ),
        const First(hello: "Byee"),
         const Stless(
          neee: "Total",
        )
      ],
    ));
  }
}
