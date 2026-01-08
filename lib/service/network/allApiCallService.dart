import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zion_app/modelClass/country_response_model.dart';
import 'package:zion_app/modelClass/landingModelClass.dart';
import 'package:zion_app/modelClass/loginModelClass.dart';
import '../../constant/const_string.dart';
import 'package:http_parser/http_parser.dart';
import 'api.dart';
import 'apiService.dart';

class AllApiCallService {
  static final _dio = ApiService.dio;

  Future<LoginModelClass?> loginAPICall({
    String? email,
    String? password,
  }) async {
    try {
      _dio.options.headers = getHeaders();
      final payload = {"email": email, "password": password};

      final data = await _dio.post(Api.loginAPI, data: payload);

      return LoginModelClass.fromJson(data.data);
    } catch (e) {
      return null;
    }
  }

  Future<LandingModelClass?> landingAPICall() async {
    try {
      _dio.options.headers = getHeaders();

      final data = await _dio.post(Api.landingScreenAPI, data: null);

      return LandingModelClass.fromJson(data.data);
    } catch (e) {
      return null;
    }
  }

  Future<CountryResponseModel?> getCountriesAPICall() async {
    try {
      _dio.options.headers = getHeaders();

      final data = await _dio.post(Api.counryListAPI, data: null);
      print(data.data);
      return CountryResponseModel.fromJson(data.data);
    } catch (e) {
      return null;
    }
  }

  //******************************************************
  //                        Common HEADER
  //******************************************************

  getHeaders() {
    final token = GetStorage().read(LocalStorageKeys.userToken);
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer ' + token,
    };
  }
}

MediaType getMediaType(String filePath) {
  String extension = filePath.split('.').last.toLowerCase();
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return MediaType('image', 'jpeg');
    case 'png':
      return MediaType('image', 'png');
    case 'bmp':
      return MediaType('image', 'bmp');
    // case 'webp':
    //   return MediaType('image', 'webp');
    case 'pdf':
      return MediaType('application', 'pdf');
    // case 'doc':
    //   return MediaType('application', 'msword');
    // case 'docx':
    //   return MediaType('application',
    //       'vnd.openxmlformats-officedocument.wordprocessingml.document');
    // case 'mp4':
    //   return MediaType('video', 'mp4');
    // case 'mp3':
    //   return MediaType('audio', 'mpeg');
    // case 'wav':
    //   return MediaType('audio', 'wav');
    default:
      return MediaType(
        'application',
        'octet-stream',
      ); // Fallback for unknown types
  }
}
