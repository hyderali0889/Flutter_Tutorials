import 'package:flutter/material.dart';
import 'package:flutter_providers/providers/Home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center( 
        child: TextButton(child: Text("Heello ${context.watch<HomeProvider>().number}") , onPressed: () { Navigator.pushNamed(context, "/second"); }, ),
       ),
    );
  }
}