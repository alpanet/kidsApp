import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  Future<void> saveNotificationPreference(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('notifications_enabled', isEnabled);
  }

  Future<bool> getNotificationPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notifications_enabled') ?? true;
  }
}
