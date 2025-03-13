import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ethereal/config/api_keys.dart';

class YouTubeService {
  static const String _baseUrl = "https://www.googleapis.com/youtube/v3";

  Future<List<String>> fetchMusicVideos(String mood) async {
    final query = "$mood 감성 플레이리스트";
    final url =
        "$_baseUrl/search?part=snippet&q=$query&type=video&maxResults=5&key=${ApiKeys.youtubeApiKey}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List videos = data['items'];
      return videos
          .map(
            (video) =>
                "https://www.youtube.com/watch?v=${video['id']['videoId']}",
          )
          .toList();
    } else {
      throw Exception("Failed to fetch videos");
    }
  }
}
