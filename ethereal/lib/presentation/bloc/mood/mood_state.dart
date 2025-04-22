abstract class MoodState {}

class MoodInitial extends MoodState {}

class MoodSelected extends MoodState {
  final String mood;
  MoodSelected(this.mood);
}

class RecentMoodsLoaded extends MoodState {
  final List<String> moods;
  RecentMoodsLoaded(this.moods);
}
