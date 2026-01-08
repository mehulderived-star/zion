class CountryModel {
  final int id;
  final String countryName;
  final String alpha2Code;
  final String dialCode;

  CountryModel({
    required this.id,
    required this.countryName,
    required this.alpha2Code,
    required this.dialCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      countryName: json['country_name'],
      alpha2Code: json['alpha_2_code'],
      dialCode: json['dial_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_name': countryName,
      'alpha_2_code': alpha2Code,
      'dial_code': dialCode,
    };
  }
}
