abstract class MusicEvent {}

class FetchMusic extends MusicEvent {
  final String mood;
  FetchMusic(this.mood);
}
