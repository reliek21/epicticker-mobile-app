import 'package:epicticker/config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/providers/crud/count_down_provider.dart';
import 'package:epicticker/presentation/widgets/snackbar_widget.dart';

class CrudCountdown {
	CrudCountdown._();

	static bool _isValidDate(String fullDate) {
		final List<String> dateParts = fullDate.split('/');

    if (dateParts.length == 3) {
      final int year = int.tryParse(dateParts[2]) ?? 0;
      final int month = int.tryParse(dateParts[1]) ?? 0;
      final int day = int.tryParse(dateParts[0]) ?? 0;

      return year > 0 && month > 0 && day > 0;
    }

    return false;
	}

	static bool isDateGreaterThanOrEqualToCurrent(String fullDate) {
    if (!_isValidDate(fullDate)) {
      return false;
    }

    final List<String> dateParts = fullDate.split('/');
    final DateTime selectedDate = DateTime(
      int.parse(dateParts[2]),
      int.parse(dateParts[1]),
      int.parse(dateParts[0]),
    );
    final DateTime currentDate = DateTime.now();

    return selectedDate.isAtSameMomentAs(currentDate) || selectedDate.isAfter(currentDate);
  }


	static void _clearAndNavigate(
		BuildContext context,
		TextEditingController? nameController,
		TextEditingController? fullDateController
	) {
		nameController?.clear();
		fullDateController?.clear();
		context.push(MainRoutes.home);
	}

	static void saveCountdown(
		BuildContext context,
		TextEditingController nameController,
		TextEditingController fullDateController,
	) {
		final String name = nameController.text;
    final String fullDate = fullDateController.text;

		if (_isValidDate(fullDate) && name.isNotEmpty) {
			final List<String> dateParts = fullDate.split('/');
      final CountdownEntity countdown = CountdownEntity(
				id: '$name-$fullDate',
        name: name,
        year: int.tryParse(dateParts[2]) ?? 0,
        month: int.tryParse(dateParts[1]) ?? 0,
        day: int.tryParse(dateParts[0]) ?? 0,
      );

      try {
				Provider.of<CountDownProvider>(context, listen: false).addCountdown(countdown);
				_clearAndNavigate(context, nameController, fullDateController);
				ReusableSnackBar.show(context: context, message: 'Congratulations, new event created.');
      } catch (e) {
				if (kDebugMode) {
				  print('Error to create a countdown: $e');
				}
      }
		}
	}

  static void updateCountdown(
    BuildContext context,
		TextEditingController nameController,
		TextEditingController fullDateController
	) {
    final String name = nameController.text;
    final String fullDate = fullDateController.text;

    if (_isValidDate(fullDate) && name.isNotEmpty) {
			final List<String> dateParts = fullDate.split('/');
			final CountdownEntity countdown = CountdownEntity(
        name: name,
        year: int.tryParse(dateParts[2]) ?? 0,
        month: int.tryParse(dateParts[1]) ?? 0,
        day: int.tryParse(dateParts[0]) ?? 0,
      );

			try {
        Provider.of<CountDownProvider>(context, listen: false).updateCountDown(countdown);
				_clearAndNavigate(context, nameController, fullDateController);
				ReusableSnackBar.show(context: context, message: 'Event updated.');
      } catch (e) {
				if (kDebugMode) {
				  print('Error to create a countdown: $e');
				}
      }
    }
  }

  static void removeCountdown(
    BuildContext context,
    CountdownEntity countDownEntity,
  ) {
    Provider.of<CountDownProvider>(context, listen: false).removeCountDown(countDownEntity);
		_clearAndNavigate(context, null, null);
		ReusableSnackBar.show(context: context, message: 'Event deleted.');
  }
}
