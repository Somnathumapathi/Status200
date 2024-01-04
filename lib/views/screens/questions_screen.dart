import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/controllers/questioncontroller.dart';
import 'package:status200/views/screens/quesdetails_screen.dart';
import 'package:status200/views/widgets/addquestiondialog.dart';
import 'package:status200/views/widgets/questionItem.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});
  final QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
                prefixIcon: Icon(Icons.search),
                //
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => (questionController.questions.length - 1) > 0
                  ? ListView.builder(
                      itemCount: questionController.questions.length - 1,
                      itemBuilder: (context, i) {
                        final _question = questionController.questions[i];
                        return InkWell(
                          onTap: () {
                            Get.to(QuesDetailsScreen(
                              qdtitle: _question.qtitle,
                              qddesc: _question.qdescription,
                              qdcat: _question.category,
                              qdImage: _question.imageUrl,
                            ));
                          },
                          child: QuestionItem(
                            qucat: _question.category,
                            qutitle: _question.qtitle,
                            qudesc: _question.qdescription,
                          ),
                        );
                      },
                    )
                  : Center(child: Text('Nothing to display')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddQuestionDialog()),
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
