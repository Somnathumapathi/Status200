import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/models/answer_model.dart';

class AnswerController extends GetxController {
  static AnswerController instance = Get.find();
  RxList<Answer> answers = <Answer>[].obs;
  RxList<Answer> quesAnswer = <Answer>[].obs;
  // RxString qid = ''.obs;

  @override
  void onInit() {
    fetchAnswers();

    super.onInit();
  }

  Future<void> fetchAnswers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> anssnap =
          await fireStore.collection('answers').get();
      answers.assignAll(anssnap.docs.map((doc) => Answer.fromMap(doc.data())));
      fireStore.collection('answers').snapshots().listen((event) {
        answers.assignAll(event.docs.map((doc) => Answer.fromMap(doc.data())));
        update();
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> getQuesAnswer(String qid) async {
    quesAnswer.assignAll(answers.where((ans) => ans.qid == qid));
  }
}
