import 'package:intl/intl.dart';

String formatCreatedAt(String dateTimeString) {
  if (dateTimeString.isEmpty) {
    return 'Invalid Date';
  }

  try {
    DateTime dateTime;

    if (dateTimeString.contains(',')) {
      // Si la cadena ya tiene el formato deseado, no es necesario parsearla
      dateTime = DateFormat('dd MMM, yyyy').parse(dateTimeString);
    } else {
      // Parsea la cadena de fecha y hora completa y luego formatea
      dateTime = DateTime.parse(dateTimeString);
    }

    return DateFormat('dd MMM, yyyy').format(dateTime);
  } catch (e) {
    print('Error formatting date. Original dateTimeString: $dateTimeString');
    print('Error details: $e');
    return 'Invalid Date';
  }
}
