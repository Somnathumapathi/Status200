import 'package:flutter/foundation.dart';

class User {
  String userName;
  String email;
  String uid;
  User({required this.userName, required this.email, required this.uid});
  Map<String, dynamic> toJson() =>
      {"name": userName, 'email': email, 'uid': uid};
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
        uid: data['uid'], email: data['email'], userName: data['username']);
  }
}
