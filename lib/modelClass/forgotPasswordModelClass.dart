import 'dart:convert';

ForgotPasswordModelClass forgotPasswordModelClassFromJson(String str) =>
    ForgotPasswordModelClass.fromJson(json.decode(str));

String forgotPasswordModelClassToJson(ForgotPasswordModelClass data) =>
    json.encode(data.toJson());

class ForgotPasswordModelClass {
  dynamic error; // Can be a String ("false") or a Map<String, List<String>>
  String? email;
  String? message;

  ForgotPasswordModelClass({this.error, this.email, this.message});

  factory ForgotPasswordModelClass.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModelClass(
        error: json["error"],
        email: json["email"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "error": error,
    "email": email,
    "message": message,
  };

  /// Check if the error is a real error (Map), or just "false"
  bool get isError => error is Map;

  /// Retrieve the first error message if it's an error response
  String? get firstErrorMessage {
    if (error is Map<String, dynamic>) {
      final firstKey = (error as Map).keys.first;
      final messages = error[firstKey];
      if (messages is List && messages.isNotEmpty) {
        return messages.first.toString();
      }
    }
    return null;
  }
}
