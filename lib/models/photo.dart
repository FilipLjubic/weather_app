class Photo {
  final String largeImageUrl;

  Photo({this.largeImageUrl});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        largeImageUrl: json['largeImageUrl'],
      );
}
