import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {

int number = 0;

int get numb => number;

void increase() { 
  number++;
  notifyListeners();
 }

}