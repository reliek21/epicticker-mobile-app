import 'package:epicticker/domain/entities/count_down_entity.dart';

FilterChipType? convertStringToFilterChipType(String? filterTypeString) {
  if (filterTypeString == null) return null;

  switch (filterTypeString) {
    case 'activated':
      return FilterChipType.activated;
    case 'archived':
      return FilterChipType.archived;
    case 'completed':
      return FilterChipType.completed;
    default:
      return null;
  }
}
