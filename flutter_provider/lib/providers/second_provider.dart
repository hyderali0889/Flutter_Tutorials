import 'package:flutter/material.dart';

class SecondProvider with ChangeNotifier {

List name = ["Ali"];

List get getName => name;

void increase() {
  name.add("Boy"); 
  
  notifyListeners();
 }

}