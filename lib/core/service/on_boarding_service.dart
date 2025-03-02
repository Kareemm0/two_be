import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_shared_pref_keys.dart';

class OnboardingService {
  Future<bool> isOnboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppSharedPrefrencesKeys.open) ?? false;
  }

  Future<void> markOnboardingAsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppSharedPrefrencesKeys.open, true);
  }
}
