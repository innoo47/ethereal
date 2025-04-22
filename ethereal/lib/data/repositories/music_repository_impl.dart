import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethereal/domain/entities/music.dart';
import 'package:ethereal/domain/repositories/music_repository.dart';

class MusicRepositoryImpl implements MusicRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<Music>> getStoredMusic(String mood) async {
    final snapshot =
        await _db.collection("moods").doc(mood).collection("songs").get();
    return snapshot.docs.map((doc) => Music.fromFirestore(doc.data())).toList();
  }

  @override
  Future<void> saveMusic(String mood, List<String> urls) async {
    final batch = _db.batch();
    final moodRef = _db.collection("moods").doc(mood);

    for (String url in urls) {
      final songRef = moodRef.collection("songs").doc();
      batch.set(songRef, Music(url: url).toFirestore());
    }

    await batch.commit();
  }
}
