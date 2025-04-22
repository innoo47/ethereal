class Mood {
  final String name;
  final String emoji;

  Mood({required this.name, required this.emoji});
}

List<Mood> moods = [
  Mood(name: "행복", emoji: "😃"),
  Mood(name: "슬픔", emoji: "😭"),
  Mood(name: "집중", emoji: "🎧"),
  Mood(name: "설렘", emoji: "💖"),
];
