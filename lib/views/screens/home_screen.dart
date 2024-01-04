import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to home'),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.dialog(AddQuestionDialog()),
      //   child: Icon(Icons.add_comment),
      // ),
    );
  }
}
