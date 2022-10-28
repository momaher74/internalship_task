class LoginModel {
  String? message;

  int? status;

  String? code;

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }
}
