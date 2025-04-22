import 'package:ethereal/core/api_service.dart';
import 'package:ethereal/domain/entities/music.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ethereal/domain/usecases/get_music_usecase.dart';
import 'package:ethereal/domain/usecases/save_music_usecase.dart';
import 'music_event.dart';
import 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetMusicUseCase getMusicUseCase;
  final SaveMusicUseCase saveMusicUseCase;

  MusicBloc(this.getMusicUseCase, this.saveMusicUseCase)
    : super(MusicInitial()) {
    on<FetchMusic>((event, emit) async {
      emit(MusicLoading());

      try {
        // Firestore에서 기존 음악 가져오기
        List<Music> storedMusic = await getMusicUseCase.execute(event.mood);

        if (storedMusic.isNotEmpty) {
          emit(MusicLoaded(storedMusic.map((e) => e.url).toList()));
        } else {
          // 없으면 새로 가져와 저장
          final videos = await fetchMusicVideos(event.mood);
          await saveMusicUseCase.execute(event.mood, videos);
          emit(MusicLoaded(videos));
        }
      } catch (e) {
        emit(MusicError("음악을 불러오는 데 실패했습니다."));
      }
    });
  }
}
