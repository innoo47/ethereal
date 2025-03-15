import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveMood(String mood) async {
    await _db.collection("mood").add({
      "mood": mood,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }

  Stream<List<String>> getRecentMoods() {
    return _db
        .collection("mood")
        .orderBy("timestamp", descending: true)
        .limit(5)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => doc["mood"] as String).toList(),
        );
  }
}
