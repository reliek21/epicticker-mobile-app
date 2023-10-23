import 'dart:convert';

import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownProvider extends ChangeNotifier {
  List<CountDownEntity> _countDownList = [];
  List<CountDownEntity> get countDownList => _countDownList;

  Future<void> loadCountDowns() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('countdownList');

    if (jsonString != null) {
      final List<dynamic> list = json.decode(jsonString);

      _countDownList = List<CountDownEntity>.from(
        list.map((item) => CountDownEntity(
          name: item['name'],
          year: item['year'],
          month: item['month'],
          day: item['day']
        )),
      );

      notifyListeners();
    }
  }

  Future<void> addCountDown(CountDownEntity task) async {
    final prefs = await SharedPreferences.getInstance();
    _countDownList.add(task);

    final jsonString = json.encode(
      _countDownList.map((item) => {
        'name': item.name,
        'year': item.year,
        'month': item.month,
        'day': item.day
      }).toList()
    );

    prefs.setString('countdownList', jsonString);

    notifyListeners();
  }



}
