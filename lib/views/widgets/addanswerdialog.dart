import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/neopop.dart';
import 'package:status200/constants.dart';
import 'package:status200/controllers/addanscontroller.dart';

class AddAnswerDialog extends StatelessWidget {
  AddAnswerDialog({super.key, required this.qid});
  String qid;
  final AddAnsController addAnsController = Get.put(AddAnsController());

  Future<void> _onAnswer(String qid, BuildContext context) async {
    if (addAnsController.anscontroller.text.isNotEmpty) {
      await addAnsController.addAnswer(qid);
      Navigator.pop(context);
    } else {
      Get.snackbar('⚠️', 'Don\'t give blank answer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add Answer :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addAnsController.anscontroller,
              maxLines: 17,
              decoration: const InputDecoration(
                  label: Text('*Your Answer'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            NeoPopTiltedButton(
              decoration: const NeoPopTiltedButtonDecoration(
                showShimmer: true,
                color: Color.fromARGB(255, 225, 205, 23),
              ),
              onTapUp: () => _onAnswer(qid, context),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 12,
                ),
                child: Text(
                  'Answer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
