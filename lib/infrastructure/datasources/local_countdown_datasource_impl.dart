import 'dart:convert';
import 'package:epicticker/utils/convert_string_filter_chip.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:epicticker/domain/datasources/countdown_datasource.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';

class LocalCountdownDatasource implements CountdownDatasource {
  List<CountdownEntity> _countDownList = <CountdownEntity>[];
  List<CountdownEntity> get countDownList => _countDownList;

  @override
  Future<void> addCountdown(CountdownEntity countdown) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _countDownList.add(countdown);

      await _updateSharePreferences(prefs);
    } catch (e) {
      if (kDebugMode) {
        print('Error to create a countdown $e');
      }
    }
  }

  @override
  Future<void> getAllCountdowns() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('countdownList');

    if (jsonString != null) {
      final List<dynamic> list = json.decode(jsonString);

      final List<CountdownEntity> countdowns = list
          .map((dynamic item) => CountdownEntity(
          name: item['name'],
          year: item['year'],
          month: item['month'],
          day: item['day'],
          filterType:  convertStringToFilterChipType(item['filterType']),
          createdAt: item['createdAt']
      )).toList();

      countdowns.sort((CountdownEntity a, CountdownEntity b) => a.eventDate.compareTo(b.eventDate));

      _countDownList = countdowns;
    }
  }

  @override
  Future<DateTime?> getClosestDate() async {
    final DateTime currentDate = DateTime.now();
    DateTime? closestDate;
    Duration closestDuration = const Duration(days: 365 * 100);

    for (final CountdownEntity countDown in _countDownList) {
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

  @override
  CountdownEntity getClosestEvent() {
    final DateTime now = DateTime.now();
    CountdownEntity? closestEvent;
    Duration closestDuration = const Duration(days: 365 * 100);

    for (final CountdownEntity event in _countDownList) {
      final DateTime eventDate = DateTime(event.year, event.month, event.day);
      final Duration duration = eventDate.difference(now);

      if (duration.isNegative) continue;

      if (duration < closestDuration) {
        closestDuration = duration;
        closestEvent = event;
      }
    }

    return closestEvent ?? CountdownEntity(
        name: 'No events in the near future',
        year: 0,
        month: 0,
        day: 0
    );
  }

  @override
  List<CountdownEntity> getRecentCountdownByDays() {
    final List<CountdownEntity> cloneList = List<CountdownEntity>.from(_countDownList);

    cloneList.sort((CountdownEntity a, CountdownEntity b) {
      final DateTime dateA = DateTime(a.year, a.month, a.day);
      final DateTime dateB = DateTime(b.year, b.month, b.day);

      final Duration durationA = dateA.difference(DateTime.now());
      final Duration durationB = dateB.difference(DateTime.now());

      return durationA.compareTo(durationB);
    });

    return cloneList;
  }

  @override
  Future<void> removeCountdown(CountdownEntity countdown) async {
    try {
      // Search index of the event
      final int index =
      _countDownList.indexWhere((CountdownEntity countDown) => countDown.id == countdown.id);

      // Delete the event of the list
      if (index != -1) _countDownList.removeAt(index);

      // save in the list of SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await _updateSharePreferences(prefs);
    } catch (e) {
      if (kDebugMode) {
        print('Error to delete a countdown $e');
      }
    }
  }

  @override
  Future<void> updateCountdown(CountdownEntity countdown) async {
    try {
      // Search index of the event
      final int index = _countDownList.indexWhere((CountdownEntity countDown) => countDown.id == countdown.id);

      // replace the event updated
      if (index != -1) _countDownList[index] = countdown;

      // save in the list of SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await _updateSharePreferences(prefs);
    } catch (e) {
      if (kDebugMode) {
        print('Error to update a countdown $e');
      }
    }
  }

	Future<void> _updateSharePreferences(SharedPreferences prefs) async {
    final String jsonString = json.encode(_countDownList
            .map((CountdownEntity countdown) => countdown.toJson)
            .toList() // toJson debería ser un método en CountdownEntity
        );

    await prefs.setString('countdownList', jsonString);
  }
}
