import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:status200/constants.dart';
import 'package:status200/models/question_model.dart';

class AddQuestionController extends GetxController {
  static AddQuestionController instance = Get.find();
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  String? qcategory;
  String? imageUrl;

  // Future<void> pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage != Null) {
  //     selectedImage = File(pickedImage!.path);
  //   }
  // }

  Future<String?> uploadImageToFirebase(File file) async {
    try {
      Reference stref = firebaseStorage.ref().child('images/${DateTime.now()}');
      UploadTask uptask = stref.putFile(file);
      await uptask.whenComplete(() async {
        // String imgUrl = await stref.getDownloadURL();
        // Get.snackbar('Uploaded', 'ImagePath: $imgUrl');
      });
      return await stref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
  }

  Future<void> addQuestion(File? file) async {
    try {
      String title = titlecontroller.text;
      String desc = desccontroller.text;
      if (file != null) {
        imageUrl = await uploadImageToFirebase(file);
      }
      final cuserId = firebaseAuth.currentUser!.uid;
      Question question = Question(
          uid: cuserId,
          qtitle: title,
          qdescription: desc,
          category: qcategory!,
          qid: null,
          imageUrl: imageUrl);

      DocumentReference docRef =
          await fireStore.collection('questions').add(question.toQJson());
      await docRef.update({'qid': docRef.id});
      print(docRef.id);
      Get.snackbar('Successfully', 'Asked Question');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
