import 'package:epicticker/domain/entities/count_down_entity.dart';

abstract class CountdownRepository {
  Future<void> addCountdown(CountdownEntity countdown);
  Future<void> getAllCountdowns();
  Future<DateTime?> getClosestDate();
  CountdownEntity getClosestEvent();
  List<CountdownEntity> getRecentCountdownByDays();
  Future<void> updateCountdown(CountdownEntity countdown);
  Future<void> removeCountdown(CountdownEntity countdown);
}
