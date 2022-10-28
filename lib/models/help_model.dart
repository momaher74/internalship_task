class HelpModel {
  int? status;

  String? message;

  List help = [];

  HelpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['help'].forEach((element) {
      help.add(HelpData.fromJson(element));
    });
  }
}

class HelpData {
  int? id;

  String? question;

  String? answer;

  HelpData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}
