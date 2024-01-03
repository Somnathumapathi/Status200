import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/models/question_model.dart';

class QuestionController extends GetxController {
  RxList<Question> questions = <Question>[].obs;

  @override
  void onInit() {
    fetchQuestions();
    super.onInit();
  }

  Future<void> fetchQuestions() async {
    try {
      QuerySnapshot<Map<String, dynamic>> quessnap =
          await fireStore.collection('questions').get();
      questions.assignAll(
          quessnap.docs.map((doc) => Question.fromMap(doc.data())).toList());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
