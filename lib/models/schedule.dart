class Schedule {
  final int hour;
  final int minute;
  final double altitude;
  final double longitude;

  const Schedule({
    required this.hour,
    required this.minute,
    required this.altitude,
    required this.longitude,
  });

  Map<String, Object?> toMap() {
    return {
      'hour': hour,
      'minute': minute,
      'altitude': altitude,
      'longitude': longitude,
    };
  }
}
