import 'package:ethereal/domain/entities/music.dart';

abstract class MusicRepository {
  Future<List<Music>> getStoredMusic(String mood);
  Future<void> saveMusic(String mood, List<String> urls);
}
