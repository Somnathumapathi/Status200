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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 7, 246, 15),
          brightness: Brightness.dark,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
