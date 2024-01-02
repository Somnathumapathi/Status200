import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/views/widgets/addquestiondialog.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddQuestionDialog()),
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
