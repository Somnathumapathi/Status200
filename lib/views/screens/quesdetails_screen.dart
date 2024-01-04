import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/views/widgets/answer_item.dart';

class QuesDetailsScreen extends StatelessWidget {
  QuesDetailsScreen(
      {super.key,
      required this.qdtitle,
      required this.qddesc,
      required this.qdcat,
      this.qdImage});
  String qdtitle;
  String qddesc;
  String qdcat;
  String? qdImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${qdtitle}' + ' :',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                      const Text('Description:'),
                      Text(
                        qddesc,
                        style: const TextStyle(color: Colors.white54),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(118, 3, 114, 7),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            qdcat.toUpperCase().split('.')[1],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '  Answers :',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            AnswerItem()
          ],
        ),
      ),
    );
  }
}
