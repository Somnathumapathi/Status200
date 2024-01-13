import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/models/question_model.dart';
import 'package:status200/models/question_model.dart';

class MyQuestionsController extends GetxController {
  static MyQuestionsController instance = Get.find();  
  RxList<Question> questions = <Question>[].obs;

  Future<void> getMyQuestions(String uid) async {
    try {
      QuerySnapshot<Map<String, dynamic>> quessnap =
          await FirebaseFirestore.instance.collection('questions').where('uid', isEqualTo: uid).get();
      questions.assignAll(
          quessnap.docs.map((doc) => Question.fromMap(doc.data())).toList());       
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<String> getCurrentUserUid() async {
    // Replace this with your actual logic to get the current user's UID
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      // Handle the case where the user is not logged in
      // You can redirect to the login screen or provide a default UID
      return "default_user_uid";
    }
  }
}



  // Future<void> getMyQuestion(String uid) async {   
  //   List<Question> myQuestions = []; 
  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('questions')
  //         .where('uid', isEqualTo: uid)
  //         .get();
  //      myQuestions = querySnapshot.docs.map((doc) => Question.fromMap(doc.data() as Map<String, dynamic>)).toList();
  //     questions.assignAll(myQuestions);   
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  //   // return questions;
  // }

 