import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:capstone_project/common/preference_helper.dart';
import 'package:capstone_project/notifcation/background.dart';
import 'package:capstone_project/notifcation/setting.dart';
import 'package:flutter/cupertino.dart';

class SchedulingProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;
  SchedulingProvider({required this.preferencesHelper}) {
    _getDailyRestaurantPreference();
  }

  bool _isScheduled = true;
  bool get isScheduled => _isScheduled;

  void _getDailyRestaurantPreference() async {
    _isScheduled = await preferencesHelper.isDailyRestaurantActive;
    notifyListeners();
  }

  void enableDailyRestaurant(bool value) {
    preferencesHelper.setDailyRestaurant(value);
    scheduledRestaurant(value);
    _getDailyRestaurantPreference();
  }

  Future<bool> scheduledRestaurant(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      debugPrint('Scheduling Restaurant Activated');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      debugPrint('Scheduling Restaurant Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
