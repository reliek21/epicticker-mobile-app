import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/provider/count_down_provider.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';
import 'package:epicticker/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:epicticker/presentation/widgets/outline_button_widget.dart';

class NewCountDownScreen extends StatefulWidget {
  const NewCountDownScreen({super.key});

  @override
  State<NewCountDownScreen> createState() => _NewCountDownScreenState();
}

class _NewCountDownScreenState extends State<NewCountDownScreen> {
  final TextEditingController _textNameController = TextEditingController();
  final TextEditingController _textYearController = TextEditingController();
  final TextEditingController _textMonthController = TextEditingController();
  final TextEditingController _textDayController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textNameController.dispose();
    _textYearController.dispose();
    _textMonthController.dispose();
    _textDayController.dispose();
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            hintText: 'Name',
            controller: _textNameController,
          ),
          const SizedBox(height: 8.0),
          CustomTextFormFieldWidget(
            hintText: 'Final Year',
            controller: _textYearController,
          ),
          const SizedBox(height: 8.0),
          CustomTextFormFieldWidget(
            hintText: 'Final Month',
            controller: _textMonthController,
          ),
          const SizedBox(height: 8.0),
          CustomTextFormFieldWidget(
            hintText: 'Final Day',
            controller: _textDayController,
          ),
          const SizedBox(height: 8.0),
          const SizedBox(height: 40.0),
          OutlineButtonWidget(
            text: 'Save',
            fillButton: true,
            onPressed: () {
              final name = _textNameController.text;
              final year = int.tryParse(_textYearController.text) ?? 0;
              final month = int.tryParse(_textMonthController.text) ?? 0;
              final day = int.tryParse(_textDayController.text) ?? 0;

              if (name.isNotEmpty && year > 0 && month > 0 && day > 0) {
                final countdown = CountDownEntity(
                  name: name,
                  year: year,
                  month: month,
                  day: day
                );

                Provider.of<CountDownProvider>(context, listen: false).addCountDown(countdown);

                // clear inputs before to add
                _textNameController.clear();
                _textYearController.clear();
                _textMonthController.clear();
                _textDayController.clear();

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
          color: EpicTickerColors.dark,
        ),
      ),
      automaticallyImplyLeading: false,
      title: Text(
        'Create a new day',
        style: EpicTickerTextStyles.heading(
          color: EpicTickerColors.dark,
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      backgroundColor: EpicTickerColors.primary,
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: EpicTickerColors.primary,
      body: SafeArea(child: SingleChildScrollView(child: _body(context))),
    );
  }
}
