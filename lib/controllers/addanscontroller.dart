import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/controllers/answercontroller.dart';

import '../models/answer_model.dart';

class AddAnsController extends GetxController {
  static AddAnsController instance = Get.find();
  final AnswerController answercontroller = Get.put(AnswerController());
  TextEditingController anscontroller = TextEditingController();
  int _upvotes = 0;
  int _downvotes = 0;

  Future<void> addAnswer(String qid) async {
    try {
      String ans = anscontroller.value.text;
      String uid = firebaseAuth.currentUser!.uid;

      Answer answer = Answer(
          uid: uid,
          qid: qid,
          answer: ans,
          upvotes: _upvotes,
          downvotes: _downvotes);
      DocumentReference docRef =
          await fireStore.collection('answers').add(answer.toAJSON());
      await docRef.update({'aid': docRef.id});
      print(docRef.id);
      answercontroller.fetchAnswers();
      Get.snackbar('Successfully', 'Answered Question');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
