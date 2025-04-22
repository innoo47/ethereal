abstract class MusicState {}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final List<String> videoUrls;
  MusicLoaded(this.videoUrls);
}

class MusicError extends MusicState {
  final String message;
  MusicError(this.message);
}
