class LocationNote {
  String title;
  double latitude;
  double longitude;

  LocationNote({
    required this.title,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationNote.fromMap(Map<String, dynamic> map) {
    return LocationNote(
      title: map['title'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
