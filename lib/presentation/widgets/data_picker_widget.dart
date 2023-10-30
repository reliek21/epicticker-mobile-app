import 'package:epicticker/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
	final String? restorationId;
	final TextEditingController controller;
	final String? initialValue;

	const DatePickerWidget({
		super.key,
		this.restorationId,
		required this.controller,
		this.initialValue
	});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> with RestorationMixin {
	@override
  String? get restorationId => widget.restorationId;

	final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
	late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
		onComplete: _selectDate,
		onPresent: (NavigatorState navigator, Object? arguments) {
			return navigator.restorablePush(
				_datePickerRoute,
				arguments: _selectedDate.value.millisecondsSinceEpoch,
			);
		},
	);

	@pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2025),
        );
      },
    );
  }

	void _selectDate(DateTime? newSelectedDate) {
		if (newSelectedDate != null) {
			setState(() {
				_selectedDate.value = newSelectedDate;
				widget.controller.text = '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
			});
		}
	}

	@override
	void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
		registerForRestoration(_selectedDate, 'selected_date');
		registerForRestoration(
			_restorableDatePickerRouteFuture, 'date_picker_route_future'
		);
	}

	@override
	 Widget build(BuildContext context) {
		return CustomTextFormFieldWidget(
			initialValue: widget.initialValue,
			hintText: 'Select the date',
			controller: widget.controller,
			onTap: () => _restorableDatePickerRouteFuture.present(),
			keyboardType: TextInputType.datetime,
		);
	}
}
