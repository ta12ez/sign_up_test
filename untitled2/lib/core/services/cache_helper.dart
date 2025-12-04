import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedpreferences;
  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({required String key, required bool value}) {
    return sharedpreferences!.setBool(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedpreferences!.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String)
      return await sharedpreferences!.setString(key, value);
    if (value is int)
      return await sharedpreferences!.setInt(key, value);
    if (value is bool)
      return await sharedpreferences!.setBool(key, value);

    else
      return await sharedpreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  })async
  {
    return await sharedpreferences!.remove(key);
  }
  static Future<bool> saveIntList({required String key, required List<int> values}) async {
    final prefs = sharedpreferences!;
    List<String> stringList = values.map((e) => e.toString()).toList();
  return  await prefs.setStringList(key, stringList);
  }

  static List<int> getIntList({required String key}) {
    final prefs = sharedpreferences!;
    List<String>? stringList = prefs.getStringList(key);
    if (stringList == null) return [];
    return stringList.map((e) => int.parse(e)).toList();
  }
}
