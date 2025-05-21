

import 'package:employeee/Model/UserModel.dart';

class LogInModel{
  LogInModel({
    this.email,
    this.password,
    this.error,
    this.token,
    required this.userModel
  });
  String? email;
  String? password;
  String? token;

  UserModel userModel;
  List<dynamic>? error;
  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
      email: json["email"]??"",
      password:json["password"]??"",
      token : json["token"]??"",
      error:json["error"],
      userModel: UserModel.fromJson(json["user"]),
  );
  Map<String, dynamic> toJson() => {
    "name": email,
    "password":password,
    "token":token,
    "user":userModel
  };
}