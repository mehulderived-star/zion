class PartnerModel {
  final String image;
  final String name;

  PartnerModel({required this.image, required this.name});

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(image: json['image'] ?? '', name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'name': name};
  }
}

class PartnerResponse {
  final int status;
  final String message;
  final List<PartnerModel> data;

  PartnerResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PartnerResponse.fromJson(Map<String, dynamic> json) {
    return PartnerResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => PartnerModel.fromJson(item))
              .toList() ??
          [],
    );
  }
}
