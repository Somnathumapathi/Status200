class Answer {
  String? aid;
  String uid;
  String qid;
  String answer;
  int upvotes;
  int downvotes;

  Answer(
      {this.aid,
      required this.uid,
      required this.qid,
      required this.answer,
      required this.upvotes,
      required this.downvotes});

  Map<String, dynamic> toAJSON() => {
        'aid': aid,
        'uid': uid,
        'qid': qid,
        'answer': answer,
        'upvotes': upvotes,
        'downvotes': downvotes
      };
  factory Answer.fromMap(Map<String, dynamic> data) {
    return Answer(
        aid: data['aid'],
        uid: data['uid'],
        qid: data['qid'],
        answer: data['answer'],
        upvotes: data['upvotes'],
        downvotes: data['downvotes']);
  }
}
