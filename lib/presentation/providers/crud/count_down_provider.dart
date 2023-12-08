import 'package:flutter/foundation.dart';
import 'package:epicticker/domain/repositories/countdown_repository.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';

class CountDownProvider extends ChangeNotifier {
  final CountdownRepository countdownRepository;

  CountDownProvider({ required this.countdownRepository });

	Future<void> addCountdown(CountdownEntity countdown) async {
    await countdownRepository.addCountdown(countdown);
    notifyListeners();
  }

	Future<void> getAllCountdowns() async {
    await countdownRepository.getAllCountdowns();
    notifyListeners();
  }

	Future<void> updateCountDown(CountdownEntity countdown) async {
    await countdownRepository.updateCountdown(countdown);
    notifyListeners();
	}

	Future<void> removeCountDown(CountdownEntity countdown) async {
    await countdownRepository.removeCountdown(countdown);
    notifyListeners();
	}

  Future<DateTime?> getClosestDate() async {
    return await countdownRepository.getClosestDate();
  }

  CountdownEntity getClosestEvent() {
    return countdownRepository.getClosestEvent();
  }

	List<CountdownEntity> getRecentCountdownByDays() {
    return countdownRepository.getRecentCountdownByDays();
  }
}
