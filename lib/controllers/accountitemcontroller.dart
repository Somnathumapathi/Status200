import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';

class AccountItemController extends GetxController {
  RxString username = ''.obs;
  RxString email = ''.obs;
  Future<void> getAccountDetails(String uid) async {
    try {
      QuerySnapshot<Map<String, dynamic>> accsnap = await fireStore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      username.value = accsnap.docs.first.get('name');
      email.value = accsnap.docs.first.get('email');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
