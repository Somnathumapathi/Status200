import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionItem extends StatelessWidget {
  String qutitle;
  String qudesc;
  String qucat;
  QuestionItem({
    super.key,
    required this.qutitle,
    required this.qudesc,
    required this.qucat,
  });

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
            qutitle,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            qudesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white54),
          ),
          SizedBox(
            height: 5,
          ),
          // Text(qucat.toUpperCase().split('.')[1])
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(118, 4, 81, 7),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                qucat.toUpperCase().split('.')[1],
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
