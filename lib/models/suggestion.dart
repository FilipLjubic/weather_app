class Suggestion {
  final String locationId;
  final String label;
  final String city;
  final String country;

  Suggestion({this.locationId, this.label, this.city, this.country});

  factory Suggestion.fromJson(dynamic json) => Suggestion(
        label: json['label'],
        locationId: json['locationId'],
        city: json['address']['city'],
        country: json['address']['country'],
      );
}
