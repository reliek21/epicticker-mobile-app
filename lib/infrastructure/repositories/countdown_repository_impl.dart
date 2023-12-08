import 'package:epicticker/domain/datasources/countdown_datasource.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/domain/repositories/countdown_repository.dart';

class CountdownRepositoryImpl extends CountdownRepository {
  final CountdownDatasource countdownDatasource;

  CountdownRepositoryImpl({
    required this.countdownDatasource
  });

  @override
  Future<void> addCountdown(CountdownEntity countdown) {
    return countdownDatasource.addCountdown(countdown);
  }

  @override
  Future<void> getAllCountdowns() {
    return countdownDatasource.getAllCountdowns();
  }

  @override
  Future<DateTime?> getClosestDate() {
    return countdownDatasource.getClosestDate();
  }

  @override
  CountdownEntity getClosestEvent() {
    return countdownDatasource.getClosestEvent();
  }

  @override
  List<CountdownEntity> getRecentCountdownByDays() {
    return countdownDatasource.getRecentCountdownByDays();
  }

  @override
  Future<void> removeCountdown(CountdownEntity countdown) {
    return countdownDatasource.removeCountdown(countdown);
  }

  @override
  Future<void> updateCountdown(CountdownEntity countdown) {
    return countdownDatasource.updateCountdown(countdown);
  }
}
