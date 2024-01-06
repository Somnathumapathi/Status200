import 'package:flutter/material.dart';
import 'package:status200/constants.dart';
import 'package:status200/controllers/answercontroller.dart';
import 'package:status200/views/widgets/account_widget.dart';

import '../../controllers/accountitemcontroller.dart';

class AnswerItem extends StatelessWidget {
  AnswerItem(
      {super.key,
      required this.aid,
      required this.answer,
      required this.upvotes,
      required this.downvotes,
      required this.userid,
      required this.accountItemController,
      required this.answerController});
  String aid;
  String answer;
  int upvotes;
  int downvotes;
  String userid;
  final AccountItemController accountItemController;
  final AnswerController answerController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            answer,
            style: const TextStyle(),
          ),
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        answerController.decUpVote(
                            aid, firebaseAuth.currentUser!.uid);

                        answerController.unDownVote(
                            aid, firebaseAuth.currentUser!.uid);
                      },
                      icon: answerController.isUpVoted(
                              aid, firebaseAuth.currentUser!.uid)
                          ? const Icon(
                              Icons.thumb_up_off_alt_sharp,
                              color: Colors.green,
                            )
                          : const Icon(Icons.thumb_up_off_alt_outlined)),
                  Text(upvotes.toString())
                ],
              ),
              const SizedBox(
                width: 3,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        answerController.decDownVote(
                            aid, firebaseAuth.currentUser!.uid);

                        answerController.unUpvote(
                            aid, firebaseAuth.currentUser!.uid);
                      },
                      icon: answerController.isDownVoted(
                              aid, firebaseAuth.currentUser!.uid)
                          ? const Icon(
                              Icons.thumb_down_alt_sharp,
                              color: Colors.green,
                            )
                          : const Icon(Icons.thumb_down_off_alt_outlined)),
                  Text(downvotes.toString())
                ],
              ),
              const Spacer(),
              const Text(
                'Helpful ? ',
                style: TextStyle(color: Colors.white38),
              )
            ],
          ),
          AccountWidget(
            userid: userid,
            accountItemController: accountItemController,
          )
        ]),
      ),
    );
  }
}
