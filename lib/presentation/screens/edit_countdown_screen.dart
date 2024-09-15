import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/providers/count_down_state.dart';
import 'package:epicticker/presentation/widgets/appbar_widget.dart';
import 'package:epicticker/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:epicticker/presentation/widgets/data_picker_widget.dart';
import 'package:epicticker/presentation/widgets/outline_button_widget.dart';
import 'package:epicticker/presentation/widgets/show_dialog.dart';
import 'package:epicticker/presentation/widgets/snackbar_widget.dart';
import 'package:epicticker/utils/crud_countdown_util.dart';

class EditCountDownScreen extends StatefulWidget {
	final CountdownEntity? currentCountdown;

  const EditCountDownScreen({
		super.key,
		required this.currentCountdown
	});

  @override
  State<EditCountDownScreen> createState() => _EditCountDownScreenState();
}

class _EditCountDownScreenState extends State<EditCountDownScreen> {
	final CountDownState _countDownState = CountDownState();

	@override
	void initState() {
		super.initState();

		_countDownState.textNameController.text = widget.currentCountdown!.name;
    _countDownState.fullDateController.text = '${widget.currentCountdown!.day}/${widget.currentCountdown!.month}/${widget.currentCountdown!.year}';
	}

  Widget _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          CustomTextFormFieldWidget(
            hintText: 'Name',
            controller: _countDownState.textNameController,
          ),
          const SizedBox(height: 8.0),
					DatePickerWidget(
						restorationId: 'main',
						controller: _countDownState.fullDateController,
					),
          const SizedBox(height: 40.0),
					OutlineButtonWidget(
            text: 'Delete event',
						outlineColor: EpicTrackerColors.intensePink,
            onPressed: () => ShowDialogWidget(
							context: context,
							onPressed: () => CrudCountdown.removeCountdown(context, widget.currentCountdown!)
						).deleteDialog()
          ),
					const SizedBox(height: 8.0),
          OutlineButtonWidget(
            text: 'Modify event',
            fillButton: true,
            onPressed: () => <Set<void>>{
							if (
								CrudCountdown.isDateGreaterThanOrEqualToCurrent(
									_countDownState.fullDateController.text
								)
							) <void>{
								ReusableSnackBar.show(
									context: context,
									message: 'The date must be greater than or equal to the current date.'
								)
							} else <void>{
								CrudCountdown.updateCountdown(
									context,
									_countDownState.textNameController,
									_countDownState.fullDateController
								)
							}
						}
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: EpicTrackerColors.accent,
      appBar: AppBarWidget.appBar(context, 'Edit event'),
			body: SafeArea(child: SingleChildScrollView(child: _body(context))),
		);
	}
}
