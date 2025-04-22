import 'package:ethereal/core/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ethereal/presentation/bloc/music/music_bloc.dart';
import 'package:ethereal/presentation/bloc/music/music_event.dart';
import 'package:ethereal/presentation/bloc/music/music_state.dart';
import 'package:ethereal/core/utils/launcher.dart';

class MusicScreen extends StatelessWidget {
  final String mood;

  const MusicScreen({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$mood 감성 플레이리스트')),
      body: BlocProvider(
        create: (context) => MusicBloc(YouTubeService())..add(FetchMusic(mood)),
        child: BlocBuilder<MusicBloc, MusicState>(
          builder: (context, state) {
            if (state is MusicLoading) {
              /* 노래 로드 중 */
              return const Center(child: CircularProgressIndicator());
            } else if (state is MusicLoaded) {
              /* 노래 로드 완료 시 */
              return ListView.builder(
                itemCount: state.videoUrls.length,
                itemBuilder: (context, index) {
                  /* 추천 노래 리스트 타일 */
                  return ListTile(
                    title: Text('추천 음악 ${index + 1}'),
                    subtitle: Text(state.videoUrls[index]),
                    onTap: () => Launcher.launchYouTube(state.videoUrls[index]),
                  );
                },
              );
            } else if (state is MusicError) {
              /* 노래 로드 에러 */
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("음악 데이터를 불러오세요."));
          },
        ),
      ),
    );
  }
}
