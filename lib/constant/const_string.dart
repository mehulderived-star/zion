import 'package:get/get.dart';

class AppString {
  static String emptyName = "Please enter your name.".tr;
  static String emptyEmail = "Please enter your email address.".tr;
  static String emptyBusinessName = "Please enter your business name.".tr;
  static String invalidEmail = "Please enter valid email address.".tr;
  static String invalidPhone = "Please enter valid phone number.".tr;
  static String emptyDesc = "Please enter description.".tr;
  static String emptyAddress = "Please enter address.".tr;
  static String emptyPhone = "Please enter your phone number.".tr;
  static String invalidAddress = "Please enter a valid address.".tr;
  static String emptyPassword = "Please enter password.".tr;

  static String termsNotAccepted =
      "Please check our End-User License Agreement.".tr;
  static String emptyOTP = "Please enter OTP.".tr;
  static String invalidPassword =
      "The password must be at least 8 characters.".tr;
  static String emptyConfirmPassword = "Please confirm your password.".tr;
  static String passwordNotMatch =
      "Your new password and confirm password does not match.".tr;

  static String generalError = "Something went wrong.".tr;
  static String agreeTerms = "Please agree to terms and conditions".tr;
  static String emptyMpin = "Please enter mpin.".tr;
  static String emptyConfirmMPin =
      "Your mpin and confirm mpin does not match.".tr;
}

class LocalStorageKeys {
  static const String userToken = "userToken";
  static const String userId = "userId";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String verificationID = "verificationID";
  static const String isRemember = "isRemember";
  static const String LanguageID = "LanguageID";
  static const String customerData = 'customerData';
}

class ApiStatusCode {
  static const sucuss = "false";
  static const error = "true";
  // static const success = 200;
  // static const block = 401;
  // static const fail = 204;
  // static const validation = 210;
  // static const user_not_verified = 220;
}

class PushNotificationCode {
  static const String inquiry = "1";
  static const String jobStatus = "2";
  static const String createdQuote = "3";
  static const String appointMentUpdate = "4";
  static const String customerPayment = "5";
  static const String admin = "6";
  static const String facebookMessage = "7";
  static const String quickblocxsMessage = "8";
}
