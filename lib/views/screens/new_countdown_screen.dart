import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/views/widgets/outline_button_widget.dart';
import 'package:epicticker/views/widgets/custom_text_form_field_widget.dart';

class NewCountDownScreen extends StatefulWidget {
  const NewCountDownScreen({super.key});

  @override
  State<NewCountDownScreen> createState() => _NewCountDownScreenState();
}

class _NewCountDownScreenState extends State<NewCountDownScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textDateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _textDateController.dispose();
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            hintText: 'Name',
            controller: _textController,
          ),
          const SizedBox(height: 8.0),
          CustomTextFormFieldWidget(
            hintText: 'Final Date',
            controller: _textDateController,
          ),
          const SizedBox(height: 40.0),
          OutlineButtonWidget(
            text: 'Save',
            fillButton: true,
            onPressed: () {},
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
