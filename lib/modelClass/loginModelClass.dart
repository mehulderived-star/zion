import 'dart:convert';

LoginModelClass loginModelClassFromJson(String str) =>
    LoginModelClass.fromJson(json.decode(str));

String loginModelClassToJson(LoginModelClass data) =>
    json.encode(data.toJson());

class LoginModelClass {
  String? message;
  String? messageType;
  String? error;
  String? accessToken;

  LoginModelClass({
    this.message,
    this.messageType,
    this.error,
    this.accessToken,
  });

  factory LoginModelClass.fromJson(Map<String, dynamic> json) =>
      LoginModelClass(
        message: json["message"],
        messageType: json["message_type"],
        error: json["error"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "message_type": messageType,
    "error": error,
    "access_token": accessToken,
  };
}
