import 'package:zion_app/Utils/youtube_utils.dart';

class TutorialModel {
  final String videoURL;
  final String title;
  final String description;
  final String thumbnailUrl;

  TutorialModel({
    required this.videoURL,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });

  factory TutorialModel.fromJson(Map<String, dynamic> json) {
    final videoUrl = json['video'];

    return TutorialModel(
      videoURL: json['video'] ?? '',
      title: json['title'] ?? '',
      description: json['Description'] ?? '',
      thumbnailUrl: YouTubeUtils.getYouTubeThumbnail(videoUrl),
    );
  }

  Map<String, dynamic> toJson() {
    return {'video': videoURL, 'title': title, 'Description': description};
  }
}

class TutorialResponse {
  final int status;
  final String message;
  final List<TutorialModel> data;

  TutorialResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TutorialResponse.fromJson(Map<String, dynamic> json) {
    return TutorialResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => TutorialModel.fromJson(item))
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
