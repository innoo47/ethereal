import 'package:ethereal/domain/repositories/music_repository.dart';

class SaveMusicUseCase {
  final MusicRepository repository;

  SaveMusicUseCase(this.repository);

  Future<void> execute(String mood, List<String> urls) async {
    await repository.saveMusic(mood, urls);
  }
}
