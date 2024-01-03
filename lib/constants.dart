import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:status200/controllers/addqcontroller.dart';
import 'package:status200/controllers/authcontroller.dart';
import 'package:status200/controllers/questioncontroller.dart';

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;
var authController = AuthController.instance;
// var questionController = QuestionController.instance;
// var addqcontroller = AddQuestionController.instance;
