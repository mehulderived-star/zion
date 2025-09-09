import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zion_app/modelClass/country_response_model.dart';
import 'package:zion_app/modelClass/whatMakeUsDifferentModel.dart';
import 'package:zion_app/service/network/api.dart';

class ApiServices {
  Future<CountryResponseModel> fetchCountries() async {
    final response = await http.post(Uri.parse(Api.counryListAPI));

    if (response.statusCode == 200) {
      return CountryResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<WhatMakeUsDifferentResponse> fetchWhatMakesUsDifferent() async {
    final url = Uri.parse(Api.whatMakeUsDifferentAPI);
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return WhatMakeUsDifferentResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
