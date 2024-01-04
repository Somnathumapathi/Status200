import 'package:flutter/material.dart';

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
          const SizedBox(
            height: 5,
          ),
          Text(
            qutitle,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            qudesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white54),
          ),
          const SizedBox(
            height: 5,
          ),
          // Text(qucat.toUpperCase().split('.')[1])
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(118, 4, 81, 7),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                qucat.toUpperCase().split('.')[1],
                style: const TextStyle(fontSize: 12),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
