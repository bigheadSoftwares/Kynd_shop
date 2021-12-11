import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveData({required String key, required String data}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool value = await prefs.setString(key, data);
  if (value == true) {
    return true;
  } else {
    return false;
  }
}

Future<String> readData(String readKey) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String key = readKey;
  final String? value = prefs.getString(key);
  return value!;
}

Future<bool> deleteLocalKey(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String finalKey = key;
  final bool val = await prefs.remove(finalKey);
  return val;
}

Future<bool> saveBool({required String key, required bool value}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool val = await prefs.setBool(key, value);
  return val;
}

Future<bool> readBool(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? val = prefs.getBool(key);
  return val ?? false;
}
