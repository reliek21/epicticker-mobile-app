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
}
