String getWeekName(int day) {
  final List<String> daysOfWeek = <String>[
		'Monday',
		'Tuesday',
		'Wednesday',
		'Thursday',
		'Friday',
		'Saturday',
		'Sunday'
	];
  return daysOfWeek[day - 1];
}
