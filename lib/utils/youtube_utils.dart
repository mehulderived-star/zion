// youtube_utils.dart
class YouTubeUtils {
  static String extractYouTubeVideoId(String url) {
    try {
      final regExp = RegExp(
        r'^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*',
        caseSensitive: false,
      );
      final match = regExp.firstMatch(url);
      return (match != null && match.group(2) != null) ? match.group(2)! : '';
    } catch (e) {
      print("Error extracting YouTube video ID: $e");
      return '';
    }
  }

  static String getYouTubeThumbnail(String videoUrl) {
    try {
      final videoId = extractYouTubeVideoId(videoUrl);
      if (videoId.isNotEmpty) {
        return 'https://img.youtube.com/vi/$videoId/0.jpg';
      }
      return '';
    } catch (e) {
      print("Error getting YouTube thumbnail: $e");
      return '';
    }
  }
}
