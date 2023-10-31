import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/providers/crud/count_down_provider.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';

class CrudCountdown {
	CrudCountdown._();

	static bool _isValidDate(String fullDate) {
		final List<String> dateParts = fullDate.split('/');

		final int year = int.tryParse(dateParts[2]) ?? 0;
		final int month = int.tryParse(dateParts[1]) ?? 0;
		final int day = int.tryParse(dateParts[0]) ?? 0;

		return year > 0 && month > 0 && day > 0;
	}

	static void _clearAndNavigate(
		BuildContext context,
		TextEditingController? nameController,
		TextEditingController? fullDateController
	) {
		nameController?.clear();
		fullDateController?.clear();
		Navigator.pushNamed(context, MainRoutes.home);
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
      final CountDownEntity countdown = CountDownEntity(
				id: '$name-$fullDate',
        name: name,
        year: int.tryParse(dateParts[2]) ?? 0,
        month: int.tryParse(dateParts[1]) ?? 0,
        day: int.tryParse(dateParts[0]) ?? 0,
      );

      try {
				Provider.of<CountDownProvider>(context, listen: false).addCountDown(countdown);
				_clearAndNavigate(context, nameController, fullDateController);
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
			final CountDownEntity countdown = CountDownEntity(
        name: name,
        year: int.tryParse(dateParts[2]) ?? 0,
        month: int.tryParse(dateParts[1]) ?? 0,
        day: int.tryParse(dateParts[0]) ?? 0,
      );

			try {
        Provider.of<CountDownProvider>(context, listen: false).updateCountDown(countdown);
				_clearAndNavigate(context, nameController, fullDateController);
      } catch (e) {
				if (kDebugMode) {
				  print('Error to create a countdown: $e');
				}
      }
    }
  }

  static void removeCountdown(
    BuildContext context,
    CountDownEntity countDownEntity,
  ) {
    Provider.of<CountDownProvider>(context, listen: false).removeCountDown(countDownEntity);
		_clearAndNavigate(context, null, null);
  }
}
