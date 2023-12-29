import 'package:flutter/material.dart';
import 'package:status200/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to home'),
          ElevatedButton(
              onPressed: () => authController.logout(), child: Text('Logout'))
        ],
      )),
    );
  }
}
