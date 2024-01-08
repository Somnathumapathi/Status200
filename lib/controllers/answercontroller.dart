import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:status200/constants.dart';
import 'package:status200/models/answer_model.dart';

class AnswerController extends GetxController {
  static AnswerController instance = Get.find();
  RxList<Answer> answers = <Answer>[].obs;
  RxList<Answer> quesAnswer = <Answer>[].obs;

  // RxString qid = ''.obs;
  final box = GetStorage();
  // @override
  // void onInit() {
  //   // fetchAnswers();

  //   super.onInit();
  // }

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

  bool isUpVoted(String aid, String uid) {
    return box.read('upVoted_${aid}_$uid') == true;
  }

  Future<void> decUpVote(String aid, uid, qid) async {
    isUpVoted(aid, uid)
        ? await unUpvote(aid, uid, qid)
        : await onUpvote(aid, uid, qid);
    update();
  }

  Future<void> onUpvote(String aid, uid, qid) async {
    try {
      final doc = await fireStore.collection('answers').doc(aid).get();

      final Answer answer = Answer.fromMap(doc.data()!);
      answer.upvotes++;
      await fireStore
          .collection('answers')
          .doc(aid)
          .update({'upvotes': answer.upvotes});
      box.write('upVoted_${aid}_$uid', true);
      await getQuesAnswer(qid);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> unUpvote(String aid, uid, qid) async {
    try {
      final doc = await fireStore.collection('answers').doc(aid).get();

      final Answer answer = Answer.fromMap(doc.data()!);
      if (answer.upvotes > 0 && firebaseAuth.currentUser!.uid == uid) {
        answer.upvotes--;

        await fireStore
            .collection('answers')
            .doc(aid)
            .update({'upvotes': answer.upvotes});
      }
      box.write('upVoted_${aid}_$uid', false);
      await getQuesAnswer(qid);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  bool isDownVoted(String aid, uid) {
    return box.read('downVoted_${aid}_$uid') == true;
  }

  Future<void> decDownVote(String aid, uid, qid) async {
    isDownVoted(aid, uid)
        ? await unDownVote(aid, uid, qid)
        : await onDownVote(aid, uid, qid);
    update();
  }

  Future<void> onDownVote(String aid, uid, qid) async {
    try {
      final doc = await fireStore.collection('answers').doc(aid).get();
      final Answer answer = Answer.fromMap(doc.data()!);
      answer.downvotes++;
      await fireStore
          .collection('answers')
          .doc(aid)
          .update({'downvotes': answer.downvotes});
      box.write('downVoted_${aid}_$uid', true);
      await getQuesAnswer(qid);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> unDownVote(String aid, uid, qid) async {
    try {
      final doc = await fireStore.collection('answers').doc(aid).get();
      final Answer answer = Answer.fromMap(doc.data()!);
      if (answer.downvotes > 0 && firebaseAuth.currentUser!.uid == uid) {
        answer.downvotes--;
        await fireStore
            .collection('answers')
            .doc(aid)
            .update({'downvotes': answer.downvotes});
      }
      box.write('downVoted_${aid}_$uid', false);
      await getQuesAnswer(qid);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
