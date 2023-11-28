class CountDownEntity {
  final String? id;
  final String name;
  final int year;
  final int month;
  final int day;
  final String? createAt;
  final FilterChipType? filterType;

  CountDownEntity({
    this.id,
    required this.name,
    required this.year,
    required this.month,
    required this.day,
    this.filterType = FilterChipType.activated,
  }) : createAt = DateTime.now().toString();

	DateTime get eventDate => DateTime(year, month, day);

	Map<String, Object> get toJson =>  <String, Object>{
		'name': name, 'year': year, 'month': month, 'day': day
	};
}

enum FilterChipType {
	activated,
	archived,
	completed
}
