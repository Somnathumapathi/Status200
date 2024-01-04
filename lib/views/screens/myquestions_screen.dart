import 'package:flutter/material.dart';

class MyQuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Questions'),
      ),
      body: const Center(
        child: Text('My questions'),
      ),
    );
  }
}
