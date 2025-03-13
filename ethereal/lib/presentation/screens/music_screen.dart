import 'package:ethereal/core/api_service.dart';
import 'package:ethereal/core/utils/launcher.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  final String mood;

  const MusicScreen({super.key, required this.mood});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final YouTubeService _youtubeService = YouTubeService();
  List<String> _videoUrls = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    try {
      final videos = await _youtubeService.fetchMusicVideos(widget.mood);
      setState(() {
        _videoUrls = videos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('${widget.mood} 감성 플레이리스트')),
        body:
            _isLoading
                ? Center(child: CircularProgressIndicator(strokeWidth: 2))
                : ListView.builder(
                  itemCount: _videoUrls.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('추천 음악 ${index + 1}'),
                      subtitle: Text(_videoUrls[index]),
                      onTap:
                          () => Launcher.launchYouTube(
                            _videoUrls[index],
                          ), // 링크 열기 추가
                    );
                  },
                ),
      ),
    );
  }
}
