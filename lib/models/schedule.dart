class Schedule {
  final int month;
  final int day;
  final int hour;
  final int minute;
  final double latitude;
  final double longitude;

  const Schedule({
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.latitude,
    required this.longitude,
  });

  Map<String, Object?> toMap() {
    return {
      'month': month,
      'day': day,
      'hour': hour,
      'minute': minute,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
