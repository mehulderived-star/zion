// To parse this JSON data, do
//
//     final landingModelClass = landingModelClassFromJson(jsonString);

import 'dart:convert';

LandingModelClass landingModelClassFromJson(String str) =>
    LandingModelClass.fromJson(json.decode(str));

String landingModelClassToJson(LandingModelClass data) =>
    json.encode(data.toJson());

class LandingModelClass {
  String error;
  landingModelData data;

  LandingModelClass({required this.error, required this.data});

  factory LandingModelClass.fromJson(Map<String, dynamic> json) =>
      LandingModelClass(
        error: json["error"],
        data: landingModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"error": error, "data": data.toJson()};
}

class landingModelData {
  List<Announcement> announcements;
  List<dynamic> quoteRequest;
  List<Country> countries;
  List<List<String>> fileUrls;
  GetCountryDetails getCountryDetails;
  List<Plan> plans;

  landingModelData({
    required this.announcements,
    required this.quoteRequest,
    required this.countries,
    required this.fileUrls,
    required this.getCountryDetails,
    required this.plans,
  });

  factory landingModelData.fromJson(Map<String, dynamic> json) =>
      landingModelData(
        announcements: List<Announcement>.from(
          json["announcements"].map((x) => Announcement.fromJson(x)),
        ),
        quoteRequest: List<dynamic>.from(json["quote_request"].map((x) => x)),
        countries: List<Country>.from(
          json["countries"].map((x) => Country.fromJson(x)),
        ),
        fileUrls: List<List<String>>.from(
          json["fileUrls"].map((x) => List<String>.from(x.map((x) => x))),
        ),
        getCountryDetails: GetCountryDetails.fromJson(
          json["getCountryDetails"],
        ),
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "announcements": List<dynamic>.from(announcements.map((x) => x.toJson())),
    "quote_request": List<dynamic>.from(quoteRequest.map((x) => x)),
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "fileUrls": List<dynamic>.from(
      fileUrls.map((x) => List<dynamic>.from(x.map((x) => x))),
    ),
    "getCountryDetails": getCountryDetails.toJson(),
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
  };
}

class Announcement {
  int id;
  String title;
  String description;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  int status;

  Announcement({
    required this.id,
    required this.title,
    required this.description,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
  };
}

class Country {
  int id;
  CountryStatut countryStatut;
  String countryName;
  String alpha2Code;
  String alpha3Code;
  String numericCode;
  String dialCode;
  CountryCurrencySymb countryCurrencySymb;
  FlatrateSupport pltSupported;
  String? threshold;
  FlatrateSupport zipCodeSupported;
  FlatrateSupport flatrateSupport;
  double? exchangeRate;
  dynamic currency;
  double percentIncrease;
  String labelSettings;
  dynamic createdAt;
  DateTime updatedAt;
  int newLabelType;

  Country({
    required this.id,
    required this.countryStatut,
    required this.countryName,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.numericCode,
    required this.dialCode,
    required this.countryCurrencySymb,
    required this.pltSupported,
    required this.threshold,
    required this.zipCodeSupported,
    required this.flatrateSupport,
    required this.exchangeRate,
    required this.currency,
    required this.percentIncrease,
    required this.labelSettings,
    required this.createdAt,
    required this.updatedAt,
    required this.newLabelType,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    countryStatut: countryStatutValues.map[json["country_statut"]]!,
    countryName: json["country_name"],
    alpha2Code: json["alpha_2_code"],
    alpha3Code: json["alpha_3_code"],
    numericCode: json["numeric_code"],
    dialCode: json["dial_code"],
    countryCurrencySymb:
        countryCurrencySymbValues.map[json["country_currency_symb"]]!,
    pltSupported: flatrateSupportValues.map[json["plt_supported"]]!,
    threshold: json["threshold"],
    zipCodeSupported: flatrateSupportValues.map[json["zip_code_supported"]]!,
    flatrateSupport: flatrateSupportValues.map[json["flatrate_support"]]!,
    exchangeRate: json["exchange_rate"]?.toDouble(),
    currency: json["currency"],
    percentIncrease: json["percent_increase"]?.toDouble(),
    labelSettings: json["label_settings"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    newLabelType: json["new_label_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_statut": countryStatutValues.reverse[countryStatut],
    "country_name": countryName,
    "alpha_2_code": alpha2Code,
    "alpha_3_code": alpha3Code,
    "numeric_code": numericCode,
    "dial_code": dialCode,
    "country_currency_symb":
        countryCurrencySymbValues.reverse[countryCurrencySymb],
    "plt_supported": flatrateSupportValues.reverse[pltSupported],
    "threshold": threshold,
    "zip_code_supported": flatrateSupportValues.reverse[zipCodeSupported],
    "flatrate_support": flatrateSupportValues.reverse[flatrateSupport],
    "exchange_rate": exchangeRate,
    "currency": currency,
    "percent_increase": percentIncrease,
    "label_settings": labelSettings,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
    "new_label_type": newLabelType,
  };
}

enum CountryCurrencySymb { CAD, EMPTY, HTG }

final countryCurrencySymbValues = EnumValues({
  "CAD": CountryCurrencySymb.CAD,
  "": CountryCurrencySymb.EMPTY,
  "HTG": CountryCurrencySymb.HTG,
});

enum CountryStatut { ON }

final countryStatutValues = EnumValues({"on": CountryStatut.ON});

enum FlatrateSupport { N, Y }

final flatrateSupportValues = EnumValues({
  "N": FlatrateSupport.N,
  "Y": FlatrateSupport.Y,
});

class GetCountryDetails {
  List<Africa> northAmerica;
  List<Africa> europe;
  List<Africa> southAmerica;
  List<Africa> asia;
  List<Africa> africa;
  List<Africa> oceania;

  GetCountryDetails({
    required this.northAmerica,
    required this.europe,
    required this.southAmerica,
    required this.asia,
    required this.africa,
    required this.oceania,
  });

  factory GetCountryDetails.fromJson(
    Map<String, dynamic> json,
  ) => GetCountryDetails(
    northAmerica: List<Africa>.from(
      json["North America"].map((x) => Africa.fromJson(x)),
    ),
    europe: List<Africa>.from(json["Europe"].map((x) => Africa.fromJson(x))),
    southAmerica: List<Africa>.from(
      json["South America"].map((x) => Africa.fromJson(x)),
    ),
    asia: List<Africa>.from(json["Asia"].map((x) => Africa.fromJson(x))),
    africa: List<Africa>.from(json["Africa"].map((x) => Africa.fromJson(x))),
    oceania: List<Africa>.from(json["Oceania"].map((x) => Africa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "North America": List<dynamic>.from(northAmerica.map((x) => x.toJson())),
    "Europe": List<dynamic>.from(europe.map((x) => x.toJson())),
    "South America": List<dynamic>.from(southAmerica.map((x) => x.toJson())),
    "Asia": List<dynamic>.from(asia.map((x) => x.toJson())),
    "Africa": List<dynamic>.from(africa.map((x) => x.toJson())),
    "Oceania": List<dynamic>.from(oceania.map((x) => x.toJson())),
  };
}

class Africa {
  String name;
  String isoAlpha2;
  String flag;
  Geo geo;

  Africa({
    required this.name,
    required this.isoAlpha2,
    required this.flag,
    required this.geo,
  });

  factory Africa.fromJson(Map<String, dynamic> json) => Africa(
    name: json["name"],
    isoAlpha2: json["iso_alpha_2"],
    flag: json["flag"],
    geo: geoValues.map[json["geo"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "iso_alpha_2": isoAlpha2,
    "flag": flag,
    "geo": geoValues.reverse[geo],
  };
}

enum Geo { AFRICA, ASIA, EUROPE, NORTH_AMERICA, OCEANIA, SOUTH_AMERICA }

final geoValues = EnumValues({
  "Africa": Geo.AFRICA,
  "Asia": Geo.ASIA,
  "Europe": Geo.EUROPE,
  "North America": Geo.NORTH_AMERICA,
  "Oceania": Geo.OCEANIA,
  "South America": Geo.SOUTH_AMERICA,
});

class Plan {
  int id;
  String name;
  String slug;
  String description;
  String features;
  String planId;
  int roleId;
  int planDefault;
  String price;
  int trialDays;
  DateTime createdAt;
  DateTime updatedAt;

  Plan({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.features,
    required this.planId,
    required this.roleId,
    required this.planDefault,
    required this.price,
    required this.trialDays,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    features: json["features"],
    planId: json["plan_id"],
    roleId: json["role_id"],
    planDefault: json["default"],
    price: json["price"],
    trialDays: json["trial_days"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "features": features,
    "plan_id": planId,
    "role_id": roleId,
    "default": planDefault,
    "price": price,
    "trial_days": trialDays,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
