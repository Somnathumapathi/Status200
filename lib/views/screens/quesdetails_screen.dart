import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/controllers/accountitemcontroller.dart';
import 'package:status200/controllers/answercontroller.dart';
import 'package:status200/views/widgets/account_widget.dart';
import 'package:status200/views/widgets/addanswerdialog.dart';
import 'package:status200/views/widgets/answer_item.dart';

class QuesDetailsScreen extends StatelessWidget {
  QuesDetailsScreen({
    super.key,
    required this.qdtitle,
    required this.qddesc,
    required this.qdcat,
    required this.qdqid,
    required this.qduid,
    this.qdImage,
  });
  String qdtitle;
  String qddesc;
  String qdcat;
  String? qdImage;
  String qdqid;
  String qduid;
  final AnswerController answerController = Get.put(AnswerController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: answerController.getQuesAnswer(qdqid),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Question Details'),
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$qdtitle :',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          qdImage != null
                              ? InteractiveViewer(
                                  boundaryMargin: const EdgeInsets.all(20.0),
                                  minScale: 0.9,
                                  maxScale: 2.0,
                                  child: Image.network(
                                    qdImage!,
                                    width: double.infinity,
                                  ),
                                )
                              : const SizedBox(
                                  height: 1,
                                ),
                          const Text(
                            'Description:',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            qddesc,
                            style: const TextStyle(color: Colors.white60),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(118, 3, 114, 7),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                qdcat.toUpperCase().split('.')[1],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AccountWidget(
                            userid: qduid,
                            accountItemController: AccountItemController(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Text(
                    '  Answers :',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: Obx(() => answerController.quesAnswer.isNotEmpty
                      ? SliverList.builder(
                          itemCount: answerController.quesAnswer.length,
                          itemBuilder: (context, i) {
                            var ans = answerController.quesAnswer[i];
                            return AnswerItem(
                              aid: ans.aid!,
                              answer: ans.answer,
                              upvotes: ans.upvotes,
                              downvotes: ans.downvotes,
                              userid: ans.uid,
                              accountItemController: AccountItemController(),
                              answerController: answerController,
                            );
                          },
                        )
                      : const SliverToBoxAdapter(
                          child: Text('No Answers Yet'),
                        )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Get.dialog(AddAnswerDialog(qid: qdqid));
                answerController.getQuesAnswer(qdqid);
              },
              child: const Icon(Icons.add_comment),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
