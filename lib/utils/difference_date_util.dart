class DateDifference {
  final int years;
  final int months;
  final int days;

  DateDifference(this.years, this.months, this.days);
}

DateDifference calculateDateDifference(int year, int month, int day) {
  final DateTime selectedDate = DateTime(year, month, day);
  final DateTime now = DateTime.now();

  final Duration difference = selectedDate.difference(now);

  // calcule difference in years, months y days
  final int years = difference.inDays ~/ 365;
  final int remainingDays = difference.inDays % 365;
  final int months = remainingDays ~/ 30;
  final int days = remainingDays % 30;

  return DateDifference(years, months, days);
}
