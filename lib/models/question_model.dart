class Question {
  String uid;
  String? qid;
  String qtitle;
  String? imageUrl;
  String qdescription;
  String category;
  Question(
      {required this.uid,
      this.qid,
      required this.qtitle,
      required this.qdescription,
      required this.category,
      this.imageUrl});

  Map<String, dynamic> toQJson() => {
        'uid': uid,
        'qid': qid,
        'qtitle': qtitle,
        'imageUrl': imageUrl,
        'qdescription': qdescription,
        'category': category.toString()
      };

  factory Question.fromMap(Map<String, dynamic> data) {
    return Question(
        uid: data['uid'],
        qid: data['qid'],
        qtitle: data['qtitle'],
        qdescription: data['qdescription'],
        category: data['category'],
        imageUrl: data.containsKey('imageUrl') ? data['imageUrl'] : null);
  }
  static QCategory _parseCategory(String cat) {
    switch (cat) {
      case 'programmingLanguages':
        return QCategory.programmingLanguages;
      case 'appDevelopment':
        return QCategory.appDevelopment;
      case 'webDevelopment':
        return QCategory.webDevelopment;
      case 'database':
        return QCategory.database;
      case 'frameworksAndLibraries':
        return QCategory.frameworksAndLibraries;
      case 'devOps':
        return QCategory.devOps;
      case 'cloudServices':
        return QCategory.cloudServices;
      case 'AI':
        return QCategory.AI;
      case 'machineLearning':
        return QCategory.machineLearning;
      case 'desktopApplications':
        return QCategory.desktopApplications;
      case 'gameDevelopment':
        return QCategory.gameDevelopment;
      case 'security':
        return QCategory.security;
      case 'networking':
        return QCategory.networking;
      case 'testing':
        return QCategory.testing;
      case 'OS':
        return QCategory.OS;
      case 'CP':
        return QCategory.CP;
      case 'general':
        return QCategory.general;
      default:
        return QCategory.general;
    }
  }
}

enum QCategory {
  programmingLanguages,
  webDevelopment,
  appDevelopment,
  database,
  frameworksAndLibraries,
  devOps,
  cloudServices,
  AI,
  machineLearning,
  desktopApplications,
  gameDevelopment,
  security,
  networking,
  testing,
  OS,
  CP,
  general,
}
