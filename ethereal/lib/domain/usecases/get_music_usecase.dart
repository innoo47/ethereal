import 'package:ethereal/domain/entities/music.dart';
import 'package:ethereal/domain/repositories/music_repository.dart';

class GetMusicUseCase {
  final MusicRepository repository;

  GetMusicUseCase(this.repository);

  Future<List<Music>> execute(String mood) async {
    // final musicList = await repository.getStoredMusic(mood);
    // return musicList.map((model) => Music(url: model.url)).toList();

    return await repository.getStoredMusic(mood);
  }
}
