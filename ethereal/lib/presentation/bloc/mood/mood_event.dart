abstract class MoodEvent {}

class SelectMood extends MoodEvent {
  final String mood;
  SelectMood(this.mood);
}

class LoadRecentMoods extends MoodEvent {}
