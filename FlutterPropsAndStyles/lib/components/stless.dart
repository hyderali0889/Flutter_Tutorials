import 'package:flutter/material.dart';

import '../styles/homestyle.dart';

class Stless extends StatelessWidget {
  final String neee;
  const Stless({Key? key, required this.neee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      neee,
    ));
  }
}
