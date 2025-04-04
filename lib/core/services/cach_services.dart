import 'package:shared_preferences/shared_preferences.dart';

class CachServices {
  final SharedPreferences sharedPreferences;

  CachServices({required this.sharedPreferences});

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return false;
  }

  dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  Future<bool> removeData({
    required String key,
  }) {
    return sharedPreferences.remove(key);
  }
}
