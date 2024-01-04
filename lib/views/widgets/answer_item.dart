import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({super.key});

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
            'Google it' * 20,
            style: const TextStyle(),
          ),
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_outlined)),
                  const Text('100')
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
                  const Text('1')
                ],
              ),
              const Spacer(),
              const Text(
                'Helpful ? ',
                style: TextStyle(color: Colors.white38),
              )
            ],
          )
        ]),
      ),
    );
  }
}
