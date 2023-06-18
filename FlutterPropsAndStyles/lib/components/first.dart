

import 'package:flutter/material.dart';

class First extends StatefulWidget {
    final String hello ;

  const First({ Key? key , required this.hello }) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.hello),
    );
  }
}