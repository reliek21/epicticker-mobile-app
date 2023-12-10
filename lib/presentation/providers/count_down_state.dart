import 'package:flutter/material.dart';

class CountDownState with ChangeNotifier {
	late TextEditingController textNameController = TextEditingController();
	late TextEditingController fullDateController = TextEditingController();

	void disposeController() {
		textNameController.dispose();
		textNameController.dispose();
	}
}
