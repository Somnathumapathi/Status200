import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';

import 'package:status200/views/widgets/addquestiondialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
