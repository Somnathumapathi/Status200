import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:status200/constants.dart';
import 'package:status200/models/user_model.dart' as model;
import 'package:status200/views/screens/my_app.dart';
import 'package:status200/views/screens/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  @override
  void onReady() {
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialState);
    super.onReady();
  }

  _setInitialState(User? user) {
    print('Authentication state changed to User: $user');
    if (user == null) {
      print('User is null, LoginScreen.');
      Get.offAll(() => LoginScreen());
    } else {
      print('User is not null, MyApp.');
      Get.offAll(() => MyApp());
    }
  }

  void registerUser(String userName, String email, String password) async {
    try {
      if (userName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        model.User user =
            model.User(userName: userName, email: email, uid: cred.user!.uid);
        await fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        Get.snackbar('✅', 'Registered');
      } else {
        Get.snackbar('⚠️ Error', 'Enter all the required feilds');
      }
    } catch (e) {
      Get.snackbar('❌ Error', e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('Login success');
        Get.snackbar('✅', 'Logged in');
      } else {
        Get.snackbar('⚠️ Error', 'Enter all the required feilds');
      }
    } catch (e) {
      Get.snackbar('❌ Error', e.toString());
    }
  }

  void logout() async {
    await firebaseAuth.signOut();
  }
}
