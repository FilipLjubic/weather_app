class Suggestion {
  final String locationId;
  final String label;
  final String city;
  final String state;
  final String country;
  final String street;
  final String district;

  Suggestion(
      {this.locationId,
      this.label,
      this.city,
      this.state,
      this.country,
      this.street,
      this.district});

  factory Suggestion.fromJson(dynamic json) => Suggestion(
        label: json['label'],
        locationId: json['locationId'],
        city: json['address']['city'],
        state: json['address']['state'],
        country: json['address']['country'],
        street: json['address']['street'],
        district: json['address']['district'],
      );
}
