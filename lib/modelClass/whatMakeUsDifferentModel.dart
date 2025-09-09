class WhatMakeUsDifferentModel {
  final String image;
  final String title;
  final String description;

  WhatMakeUsDifferentModel({
    required this.image,
    required this.title,
    required this.description,
  });

  factory WhatMakeUsDifferentModel.fromJson(Map<String, dynamic> json) {
    return WhatMakeUsDifferentModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'title': title, 'description': description};
  }
}

class WhatMakeUsDifferentResponse {
  final int status;
  final String message;
  final List<WhatMakeUsDifferentModel> data;

  WhatMakeUsDifferentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WhatMakeUsDifferentResponse.fromJson(Map<String, dynamic> json) {
    return WhatMakeUsDifferentResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => WhatMakeUsDifferentModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
