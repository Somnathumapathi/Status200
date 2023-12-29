import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/views/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Status 200',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
