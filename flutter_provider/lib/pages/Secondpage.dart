import 'package:flutter/material.dart';
import 'package:flutter_providers/providers/Home_provider.dart';
import 'package:provider/provider.dart';

import '../providers/second_provider.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heello ${context.watch<HomeProvider>().number}"),
      ),
      body: Container(
        child: Column(children: [
          TextButton(
              onPressed: () {
                context.read<HomeProvider>().increase();
              },
              child: Text("Heello ${context.watch<HomeProvider>().number}")),
          TextButton(
              onPressed: () {
                context.read<SecondProvider>().increase();
              },
              child: Text("Heello ${context.watch<SecondProvider>().name}")),
        ]),
      ),
    );
  }
}
