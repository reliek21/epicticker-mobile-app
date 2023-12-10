String timeRemainingFormat(int year, int month, int day) {
  if (year < 1 && month < 1 && day < 1) return '';

  List<String> parts = <String>[];

  if (year >= 1) {
    parts.add(year == 1 ? '1 year' : '$year years');
  }

  if (month >= 1) {
    parts.add(month == 1 ? '1 month' : '$month months');
  }

  if (day >= 1) {
    parts.add(day == 1 ? '1 day' : '$day days');
  }

  return parts.join(', ');
}
