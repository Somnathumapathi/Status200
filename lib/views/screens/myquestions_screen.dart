import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/controllers/accountitemcontroller.dart';
import 'package:status200/controllers/answercontroller.dart';
import 'package:status200/controllers/myquestionscontroller.dart';
import 'package:status200/views/screens/quesdetails_screen.dart';
import 'package:status200/views/widgets/questionItem.dart';

class MyQuestionsScreen extends StatelessWidget {
  final MyQuestionsController myQuestionsController =
      Get.put(MyQuestionsController());

  MyQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myQuestionsController.getCurrentUserUid(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String uid = snapshot.data as String;

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Questions'),
            ),
            body: FutureBuilder(
              future: myQuestionsController.getMyQuestions(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (myQuestionsController.questions.isEmpty) {
                    return const Center(child: Text('No questions to display'));
                  } else {
                    return ListView.builder(
                      itemCount: myQuestionsController.questions.length,
                      itemBuilder: (context, i) {
                        final _question = myQuestionsController.questions[i];
                        return InkWell(
                          onTap: () async {
                            final AnswerController answerController =
                                        Get.put(AnswerController());
                                    await answerController.fetchAnswers();
                                    Get.to(() => QuesDetailsScreen(
                                          qdtitle: _question.qtitle,
                                          qddesc: _question.qdescription,
                                          qdcat: _question.category,
                                          qdImage: _question.imageUrl,
                                          qdqid: _question.qid!,
                                          qduid: _question.uid,
                                        ));
                          },
                          child: QuestionItem(
                            qucat: _question.category,
                            qutitle: _question.qtitle,
                            qudesc: _question.qdescription,
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
