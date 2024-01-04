import 'package:flutter/foundation.dart';
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
          SizedBox(
            height: 5,
          ),
          Text(
            'Google it' * 20,
            style: TextStyle(),
          ),
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.thumb_up_outlined)),
                  Text('100')
                ],
              ),
              SizedBox(
                width: 3,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.thumb_down_outlined)),
                  Text('1')
                ],
              ),
              Spacer(),
              Text(
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
