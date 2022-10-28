class OTPModel {
  int? status;
  String? message;
  AccountModel? accountModel;

  OTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accountModel = AccountModel.fromJson(json['account']);
  }
}

class AccountModel {
  int? id;

  String? name;

  String? phone;

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
