class Suggestion {
  final String locationId;
  final String label;

  Suggestion({this.locationId, this.label});

  factory Suggestion.fromJson(dynamic json) => Suggestion(
        label: json['label'],
        locationId: json['locationId'],
      );
}
