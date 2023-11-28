class CountDownEntity {
  final String? id;
  final String name;
  final int year;
  final int month;
  final int day;
  final String? createdAt;
  final FilterChipType? filterType;

	CountDownEntity({
		this.id,
		required this.name,
		required this.year,
		required this.month,
		required this.day,
		this.createdAt,
		this.filterType,
	}) : assert(year >= 0 && month >= 0 && month <= 12 && day >= 0 && day <= 31);



	DateTime get eventDate => DateTime(year, month, day);

	Map<String, Object> get toJson =>  <String, Object>{
		'name': name,
		'year': year,
		'month': month,
		'day': day,
		'createdAt': createdAt ?? DateTime.now().toString(),
		'filterType': filterType.toString()
	};
}

enum FilterChipType {
	activated,
	archived,
	completed
}
