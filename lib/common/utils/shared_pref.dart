import 'dart:convert';

import 'package:getx_scaffold/getx_scaffold.dart';

/// Add a value in SharedPref based on their type - Must be a String, int, bool, double, Map<String, dynamic> or StringList
Future<bool> setValue(String key, dynamic value, {bool print = true}) async {
  if (print) log('${value.runtimeType} - $key : $value', 'SharedPreferences');

  if (value is String) {
    return await sharedPreferences.setString(key, value);
  } else if (value is int) {
    return await sharedPreferences.setInt(key, value);
  } else if (value is bool) {
    return await sharedPreferences.setBool(key, value);
  } else if (value is double) {
    return await sharedPreferences.setDouble(key, value);
  } else if (value is Map<String, dynamic>) {
    return await sharedPreferences.setString(key, jsonEncode(value));
  } else if (value is List<String>) {
    return await sharedPreferences.setStringList(key, value);
  } else {
    throw ArgumentError(
        'Invalid value ${value.runtimeType} - Must be a String, int, bool, double, Map<String, dynamic> or StringList');
  }
}

/// Returns List of Keys that matches with given Key
List<String> getMatchingSharedPrefKeys(String key) {
  List<String> keys = [];

  sharedPreferences.getKeys().forEach((element) {
    if (element.contains(key)) {
      keys.add(element);
    }
  });

  return keys;
}

/// Returns a StringList if exists in SharedPref
List<String>? getStringListAsync(String key) {
  return sharedPreferences.getStringList(key);
}

/// Returns a Bool if exists in SharedPref
bool getBoolAsync(String key, {bool defaultValue = false}) {
  return sharedPreferences.getBool(key) ?? defaultValue;
}

/// Returns a Double if exists in SharedPref
double getDoubleAsync(String key, {double defaultValue = 0.0}) {
  return sharedPreferences.getDouble(key) ?? defaultValue;
}

/// Returns a Int if exists in SharedPref
int getIntAsync(String key, {int defaultValue = 0}) {
  return sharedPreferences.getInt(key) ?? defaultValue;
}

/// Returns a String if exists in SharedPref
String getStringAsync(String key, {String defaultValue = ''}) {
  return sharedPreferences.getString(key) ?? defaultValue;
}

/// Returns a JSON if exists in SharedPref
Map<String, dynamic> getJSONAsync(String key,
    {Map<String, dynamic>? defaultValue}) {
  if (sharedPreferences.containsKey(key) &&
      (sharedPreferences.getString(key)?.isNotEmpty ?? false)) {
    return jsonDecode(sharedPreferences.getString(key)!);
  } else {
    return defaultValue ?? {};
  }
}

/// remove key from SharedPref
Future<bool> removeKey(String key) async {
  return await sharedPreferences.remove(key);
}

/// clear SharedPref
Future<bool> clearSharedPref() async {
  return await sharedPreferences.clear();
}
