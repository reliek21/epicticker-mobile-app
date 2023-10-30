class CountDownEntity {
  final String name;
  final int year;
  final int month;
  final int day;

  const CountDownEntity({
    required this.name,
    required this.year,
    required this.month,
    required this.day,
  });

	DateTime get eventDate => DateTime(year, month, day);

	Map<String, Object> get toJson =>  <String, Object>{
		'name': name, 'year': year, 'month': month, 'day': day
	};
}
