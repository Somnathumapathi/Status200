class Answer {
  String uid;
  String qid;
  String answer;
  int upvotes;
  int downvotes;

  Answer(
      {required this.uid,
      required this.qid,
      required this.answer,
      required this.upvotes,
      required this.downvotes});

  Map<String, dynamic> toAJSON() => {
        'uid': uid,
        'qid': qid,
        'answer': answer,
        'upvotes': upvotes,
        'downvotes': downvotes
      };
  factory Answer.fromMap(Map<String, dynamic> data) {
    return Answer(
        uid: data['uid'],
        qid: data['qid'],
        answer: data['answer'],
        upvotes: data['upvotes'],
        downvotes: data['downvotes']);
  }
}
