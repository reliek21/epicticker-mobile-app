import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownProvider extends ChangeNotifier {
  List<CountDownEntity> _countDownList = <CountDownEntity>[];
  List<CountDownEntity> get countDownList => _countDownList;

  Future<void> loadCountDowns() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('countdownList');

    if (jsonString != null) {
      final List<dynamic> list = json.decode(jsonString);

      _countDownList = List<CountDownEntity>.from(
        list.map((dynamic item) => CountDownEntity(
          name: item['name'],
          year: item['year'],
          month: item['month'],
          day: item['day']
        )),
      );

      notifyListeners();
    }
  }

	Future<DateTime?> getClosestDate() async {
    final DateTime currentDate = DateTime.now();
    DateTime? closestDate;
    Duration closestDuration = const Duration(days: 365 * 100);

    for (final CountDownEntity countDown in _countDownList) {
      final DateTime countDownDate = DateTime(countDown.year, countDown.month, countDown.day);
      final Duration duration = countDownDate.difference(currentDate);

      if (duration.isNegative) continue;

      if (duration < closestDuration) {
        closestDuration = duration;
        closestDate = countDownDate;
      }
    }

    return closestDate;
  }

	CountDownEntity getClosestEvent() {
    final DateTime now = DateTime.now();
    CountDownEntity? closestEvent;
    Duration closestDuration = const Duration(days: 365 * 100);
    for (final CountDownEntity event in _countDownList) {
      final DateTime eventDate = DateTime(event.year, event.month, event.day);
      final Duration duration = eventDate.difference(now);

      if (duration.isNegative) continue;

      if (duration < closestDuration) {
        closestDuration = duration;
        closestEvent = event;
      }
    }

    return closestEvent ?? const CountDownEntity(name: 'No upcoming events', year: 0, month: 0, day: 0);
  }



  Future<void> addCountDown(CountDownEntity task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _countDownList.add(task);

    final String jsonString = json.encode(
      _countDownList.map((CountDownEntity item) => <String, Object>{
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
