import 'package:flutter/material.dart';
import 'package:status200/views/widgets/account_widget.dart';

class AnswerItem extends StatelessWidget {
  AnswerItem(
      {super.key,
      required this.answer,
      required this.upvotes,
      required this.downvotes,
      required this.userid});
  String answer;
  int upvotes;
  int downvotes;
  String userid;

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
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_outlined)),
                  Text(upvotes.toString())
                ],
              ),
              const SizedBox(
                width: 3,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_down_outlined)),
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
          AccountWidget(userid: userid)
        ]),
      ),
    );
  }
}
