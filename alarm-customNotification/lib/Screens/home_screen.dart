import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

import '../Services/local_notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late final LocalNotificationService service;

 showNot() {
  service.showNotification(id: 0, title: "Hello", body: "Alarm On");
  print("object");

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OutlinedButton(
      onPressed: () {
        AndroidAlarmManager.periodic(Duration(seconds: 2), Random().nextInt(500), showNot);
      },
      child: const Text("Press Me"),
    )));
  }
}


