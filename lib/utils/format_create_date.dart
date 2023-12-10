import 'package:intl/intl.dart';

String formatCreatedAt(String dateTimeString) {
  if (dateTimeString.isEmpty) {
    return 'Invalid Date';
  }

  try {
    DateTime dateTime;

    if (dateTimeString.contains(',')) {
      dateTime = DateFormat('dd MMM, yyyy').parse(dateTimeString);
    } else {
      dateTime = DateTime.parse(dateTimeString);
    }

    return DateFormat('dd MMM, yyyy').format(dateTime);
  } catch (e) {
    return 'Invalid Date';
  }
}
