class Suggestion {
  final String locationId;
  final String label;
  final String city;

  Suggestion({this.locationId, this.label, this.city});

  factory Suggestion.fromJson(dynamic json) => Suggestion(
        label: json['label'],
        locationId: json['locationId'],
        city: json['address']['city'],
      );
}
