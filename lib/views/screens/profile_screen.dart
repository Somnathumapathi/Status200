// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/controllers/accountitemcontroller.dart';
import 'package:status200/controllers/answercontroller.dart';
import 'package:status200/controllers/myquestionscontroller.dart';
import 'package:status200/views/screens/myquestions_screen.dart';
import 'package:status200/views/screens/quesdetails_screen.dart';
import 'package:status200/views/widgets/questionItem.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  final MyQuestionsController myQuestionsController =
      Get.put(MyQuestionsController());
  final String userName;
  final Color backgroundColor;
  final Color textColor;

  ProfileScreen(
      {this.userName = "name",
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      super.key});

  // String get firstLetter => this.userName.substring(0, 1).toUpperCase();
  final AccountItemController accountItemController =
      Get.put(AccountItemController());

  @override
  Widget build(BuildContext context) {
    //String firstLetter = userName.isNotEmpty ? userName[0].toUpperCase() : '';
    return FutureBuilder(
        future: accountItemController
            .getAccountDetails(firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          return Scaffold(
            //backgroundColor: const Color.fromARGB(61, 0, 0, 0),
            body: Center(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 40.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Color.fromARGB(129, 0, 0, 0),
                          child: Text(
                              accountItemController.username.value
                                  .substring(0, 1),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 10, 56, 12),
                                  fontSize: 60.0)),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 13.0,
                                  right: 5.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                accountItemController.username.value,
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            //const SizedBox(height: 10.0),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 13.0,
                                  right: 5.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                accountItemController.email.value,
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            // const SizedBox(height: 10.0),
                            TextButton.icon(
                              onPressed: () => authController.logout(),
                              label: const Text(
                                'Logout',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 34, 113, 40),
                                    fontSize: 15.0),
                              ),
                              icon: const Icon(
                                Icons.logout,
                                color: Color.fromARGB(255, 34, 113, 40),
                                size: 25.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ])
                    ]),
                    const SizedBox(height: 20.0),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'MY QUESTIONS',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      child: FutureBuilder(
                         future: myQuestionsController.getCurrentUserUid(),
                          builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (myQuestionsController.questions.isEmpty) {
                    return const Center(child: Text('No questions to display'));
                  } else {
                    return ListView.builder(
                      itemCount: myQuestionsController.questions.length<3? myQuestionsController.questions.length:3,
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
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () => Get.to(MyQuestionsScreen()),
                            child: const Text(
                            'Show more',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}