import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/Routes/main_routes.dart';
import 'config/Theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.red));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Google Maps',
      theme: theme,
      routerConfig: router,
    );
  }
}
