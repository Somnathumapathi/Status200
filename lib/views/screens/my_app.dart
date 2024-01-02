import 'package:flutter/material.dart';
import 'package:status200/constants.dart';
import 'package:status200/views/screens/home_screen.dart';
import 'package:status200/views/screens/profile_screen.dart';
import 'package:status200/views/screens/questions_screen.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _screenIndex = 0;

  List<String> _title = ['Home', 'Questions', 'Profile'];

  List<Widget> _screens = [HomeScreen(), QuestionScreen(), ProfileScreen()];
  void onTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_screenIndex]),
      ),
      body: IndexedStack(
        index: _screenIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: _title[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: _title[1]),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: _title[2]),
        ],
        onTap: onTapped,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
