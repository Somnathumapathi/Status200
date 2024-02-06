import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/models/question_model.dart';

class QuestionController extends GetxController {
  static QuestionController instance = Get.find();
  RxList<Question> questions = <Question>[].obs;
  RxList<Question> searchResults = <Question>[].obs;

  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    fetchQuestions();

    ever(searchQuery, (_) => searchResult());
    super.onInit();
  }

  Future<void> fetchQuestions() async {
    try {
      QuerySnapshot<Map<String, dynamic>> quessnap =
          await fireStore.collection('questions').get();
      questions.assignAll(
          quessnap.docs.map((doc) => Question.fromMap(doc.data())).toList());
      // print(questions.length);

      fireStore.collection('questions').snapshots().listen((event) {
        questions.assignAll(
            event.docs.map((doc) => Question.fromMap(doc.data())).toList());
        searchResults.assignAll(questions);
        // searchResults();
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void setSearchQuery(String q) {
    searchQuery.value = q.toLowerCase();
  }

  void searchResult() {
    if (searchQuery.isEmpty) {
      searchResults.assignAll(questions);
    } else {
      searchResults.assignAll(questions.where((q) =>
          q.qtitle.toLowerCase().contains(searchQuery) ||
          q.qdescription.toLowerCase().contains(searchQuery)));
    }
  }

  void clearSearch() {
    searchQuery.value = '';
    searchResults.assignAll(questions);
  }
}