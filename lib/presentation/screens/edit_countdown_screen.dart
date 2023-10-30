import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/provider/count_down_provider.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';
import 'package:epicticker/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:epicticker/presentation/widgets/data_picker_widget.dart';
import 'package:epicticker/presentation/widgets/outline_button_widget.dart';

class EditCountDownScreen extends StatefulWidget {
	final CountDownEntity? currentCountdown;

  const EditCountDownScreen({
		super.key,
		required this.currentCountdown
	});

  @override
  State<EditCountDownScreen> createState() => _EditCountDownScreenState();
}

class _EditCountDownScreenState extends State<EditCountDownScreen> {
  final TextEditingController _textNameController = TextEditingController();
  final TextEditingController _textFullDateController = TextEditingController();


	@override
	void initState() {
		super.initState();

		_textNameController.text = widget.currentCountdown!.name;
    _textFullDateController.text = '${widget.currentCountdown!.day}/${widget.currentCountdown!.month}/${widget.currentCountdown!.year}';
	}

  Widget _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          CustomTextFormFieldWidget(
            hintText: 'Name',
            controller: _textNameController,
          ),
          const SizedBox(height: 8.0),
					DatePickerWidget(
						restorationId: 'main',
						controller: _textFullDateController,
					),
          const SizedBox(height: 40.0),
					OutlineButtonWidget(
            text: 'Delete',
						outlineColor: EpicTickerColors.intensePink,
            onPressed: () {
							final String name = _textNameController.text;

							Provider.of<CountDownProvider>(context, listen: false).removeCountDown(name);

							_textNameController.clear();
							Navigator.pushNamed(context, MainRoutes.home);
						}
          ),
					const SizedBox(height: 8.0),
          OutlineButtonWidget(
            text: 'Update Day',
            fillButton: true,
            onPressed: () {
              final String name = _textNameController.text;
							final String fullDate = _textFullDateController.text;
              final List<String> dateParts = fullDate.split('/');

								if (dateParts.length == 3) {
									final int year = int.tryParse(dateParts[2]) ?? 0;
									final int month = int.tryParse(dateParts[1]) ?? 0;
									final int day = int.tryParse(dateParts[0]) ?? 0;

								if (name.isNotEmpty && year > 0 && month > 0 && day > 0) {
									final CountDownEntity countdown = CountDownEntity(
										name: name,
										year: year,
										month: month,
										day: day
									);

									Provider.of<CountDownProvider>(context, listen: false).updateCountDown(countdown);
								}

                // clear inputs before to add
                _textNameController.clear();
								_textFullDateController.clear();

                Navigator.pushNamed(context, MainRoutes.home);
              }
            },
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context)  {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: EpicTickerColors.main,
        ),
      ),
      automaticallyImplyLeading: false,
      title: Text(
        'Edit day',
        style: EpicTickerTextStyles.heading(
          color: EpicTickerColors.main,
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      backgroundColor: EpicTickerColors.accent,
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: EpicTickerColors.accent,
      body: SafeArea(child: SingleChildScrollView(child: _body(context))),
    );
  }
}
