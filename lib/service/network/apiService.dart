import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constant/const_string.dart';
import '../../constant/utilities.dart';
import '../../main.dart';
import '../../navigation/routename.dart';
import 'api.dart';

class ApiService {
  static BaseOptions options = BaseOptions(
    baseUrl: Api.baseUrl,
    responseType: ResponseType.json,
    sendTimeout: const Duration(minutes: 30),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: "application/json",
    headers: {
      'Accept': 'application/json',
      'apptype': Platform.isAndroid ? 'android' : 'ios',
      'deviceId': '123456',
      'deviceToken': fcmToken != null ? fcmToken! : "xxxxxx",
      'deviceTypeId': '1',
      'userToken': GetStorage().read(LocalStorageKeys.userToken),
      'userId': GetStorage().read(LocalStorageKeys.userId),
    },

    // ignore: missing_return
    validateStatus: (code) {
      if (code == 401) {
        final localStorage = GetStorage();
        // localStorage.erase();
        userId = null;
        userToken = null;
        refreshToken = localStorage.read(LocalStorageKeys.refreshToken);
        isRemember = localStorage.read(LocalStorageKeys.isRemember);
        if (isAccessTokenExpired == false) {
          // localStorage.erase();
          // CancelToken().cancel();

          Get.offAllNamed(RouterName.signInScreen);
          showWarningToast("Your access token has been expired.".tr);
          isAccessTokenExpired = true;
        }
        return false;
      } else if (code == 302) {
        // Get.offAllNamed(RouterName.acceptedThankYouScreen);
        return false;
      } else {
        return true;
      }
    },
  );

  static final dio = Dio(options)
    ..interceptors.add(
      PrettyDioLogger(
        request: !isProduction,
        requestHeader: !isProduction,
        requestBody: !isProduction,
        responseBody: !isProduction,
        responseHeader: !isProduction,
        compact: true,
      ),
    );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
