class User {
  String userName;
  String email;
  String uid;
  User({required this.userName, required this.email, required this.uid});
  Map<String, dynamic> toJson() =>
      {"name": userName, 'email': email, 'uid': uid};
}
