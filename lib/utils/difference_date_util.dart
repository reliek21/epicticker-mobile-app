String calculateDateDifference(int year, int month, int day) {
  final DateTime selectedDate = DateTime(year, month, day);
  final DateTime now = DateTime.now();

  final Duration difference = selectedDate.difference(now);

  // Remaining years
  final years = difference.inDays ~/ 365;

  // Remaining months
  final remainingDays = difference.inDays % 365;
  final months = remainingDays ~/ 30;

  // Remaining days
  final days = remainingDays % 30;

  return conditionalToShowDate(years, months, days);
}

String conditionalToShowDate(int year, int month, int day) {
  final parts = <String>[];

  if (year > 0) {
    parts.add('$year year${year > 1 ? 's' : ''}');
  }

  if (month > 0) {
    parts.add('$month month${month > 1 ? 's' : ''}');
  }

  if (day > 0) {
    parts.add('$day day${day > 1 ? 's' : ''}');
  }

  return parts.isEmpty ? '0 days' : parts.join(', ');
}


