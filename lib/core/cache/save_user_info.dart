import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_be/Features/Auth/Data/Model/user.dart';
import 'package:two_be/core/constant/app_shared_pref_keys.dart';

Future<void> saveUserToSharedPreferences(User user,
    [Map<String, dynamic>? updates]) async {
  final prefs = await SharedPreferences.getInstance();

  final existingUserData = prefs.getString(AppSharedPrefrencesKeys.user);

  if (existingUserData != null) {
    final Map<String, dynamic> userMap = jsonDecode(existingUserData);

    if (updates != null) {
      userMap.addAll(updates);
    }

    await prefs.setString(AppSharedPrefrencesKeys.user, jsonEncode(userMap));
  } else {
    final newUser = user.toJson();

    if (updates != null) {
      newUser.addAll(updates);
    }

    await prefs.setString(AppSharedPrefrencesKeys.user, jsonEncode(newUser));
  }
}

Future<User?> getUserFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString(AppSharedPrefrencesKeys.user);
  if (userJson != null) {
    log("cached User Data $userJson");
    return User.fromJson(jsonDecode(userJson));
  }
  return null;
}

Future<void> clearUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(AppSharedPrefrencesKeys.user);
  log("Cache is Cleared");
}

Future<void> saveCookie(String cookie) async {
  final prefs = await SharedPreferences.getInstance();
  log("Cookie Saved: $cookie");
  await prefs.setString('cookie', cookie);
}

Future<String?> getCookie() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('cookie');
}
// Future<void> updateCookieFromResponse(Response response) async {
//   final headers = response.headers.map;
//   if (headers.containsKey('Cookie')) {
//     String? rawCookie = headers['Cookie']?.first;
//     if (rawCookie != null) {
//       final sessionCookie = rawCookie.split(';').first;
//       await saveCookie(sessionCookie);
//       log('New Cookie Saved: $sessionCookie');
//     }
//   }
// }
