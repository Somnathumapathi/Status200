import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:status200/controllers/questioncontroller.dart';
import 'package:status200/views/screens/quesdetails_screen.dart';
import 'package:status200/views/widgets/addquestiondialog.dart';
import 'package:status200/views/widgets/questionItem.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});
  final QuestionController questionController = Get.put(QuestionController());
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: questionController.fetchQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) =>
                          questionController.setSearchQuery(value),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        suffixIcon: IconButton(
                            onPressed: () {
                              _searchController.clear();
                              questionController.clearSearch();
                            },
                            icon: const Icon(Icons.cancel_outlined)),
                        prefixIcon: const Icon(Icons.search),
                        //
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => (questionController.searchResults.isNotEmpty)
                          ? ListView.builder(
                              itemCount:
                                  questionController.searchResults.length,
                              itemBuilder: (context, i) {
                                final _question =
                                    questionController.searchResults[i];
                                return InkWell(
                                  onTap: () {
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
                            )
                          : const Center(child: Text('Nothing to display')),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Get.dialog(AddQuestionDialog()),
                child: const Icon(Icons.add_comment),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
