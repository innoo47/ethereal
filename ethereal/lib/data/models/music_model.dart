class MusicModel {
  final String url;

  MusicModel({required this.url});

  factory MusicModel.fromFirestore(Map<String, dynamic> json) {
    return MusicModel(url: json['url']);
  }

  Map<String, dynamic> toFirestore() {
    return {'url': url};
  }
}
