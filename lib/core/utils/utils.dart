/// Calculate current Season of the year
/// Based on today's date and time
String getCurrentSeason() {
  final month = DateTime.now().month;

  if (month >= 4 && month <= 6) {
    return 'Spring';
  } else if (month >= 7 && month <= 9) {
    return 'Summer';
  } else if (month >= 10 && month <= 12) {
    return 'Fall';
  } else if (month >= 1 && month <= 3) {
    return 'Winter';
  } else {
    throw Exception('This season doesn\'t exsit.');
  }
}

/// generates past years
List<int> generateYears(int pastYears) {
  final currentYear = DateTime.now().year;
  return List<int>.generate(
    pastYears + 1,
    (index) => currentYear - index,
  );
}
