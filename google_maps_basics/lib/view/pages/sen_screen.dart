import 'package:flutter/material.dart';

class SenScreen extends StatefulWidget {
  const SenScreen({super.key});

  @override
  State<SenScreen> createState() => _SenScreenState();
}

class _SenScreenState extends State<SenScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
         width:size.width,
         height:size.height,
          child:const Column(
            children: [],
        ),
       )
      ),
    );
  }
}