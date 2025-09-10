import 'country_model.dart';

class CountryResponseModel {
  final int status;
  final String message;
  final List<CountryModel> data;

  CountryResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CountryModel> countries =
        list.map((i) => CountryModel.fromJson(i)).toList();

    return CountryResponseModel(
      status: json['status'],
      message: json['message'],
      data: countries,
    );
  }
}
