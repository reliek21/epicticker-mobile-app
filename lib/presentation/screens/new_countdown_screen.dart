import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/presentation/providers/countdown/count_down_state.dart';
import 'package:epicticker/presentation/widgets/appbar_widget.dart';
import 'package:epicticker/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:epicticker/presentation/widgets/data_picker_widget.dart';
import 'package:epicticker/presentation/widgets/outline_button_widget.dart';
import 'package:epicticker/utils/crud_countdown_util.dart';

class NewCountDownScreen extends StatefulWidget {
  const NewCountDownScreen({super.key});

  @override
  State<NewCountDownScreen> createState() => _NewCountDownScreenState();
}

class _NewCountDownScreenState extends State<NewCountDownScreen> {
	final CountDownState _countDownState = CountDownState();

  @override
  void dispose() {
    super.dispose();
		_countDownState.dispose();
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
            text: 'Save',
            fillButton: true,
            onPressed: () => CrudCountdown.saveCountdown(
							context,
							_countDownState.textNameController,
							_countDownState.fullDateController
						)
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBar(context, 'Create a new day'),
      backgroundColor: EpicTrackerColors.accent,
      body: SafeArea(child: SingleChildScrollView(child: _body(context))),
    );
  }
}
