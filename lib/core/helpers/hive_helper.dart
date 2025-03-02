import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  // private constructor to prevent instantiation
  HiveHelper._();

  static Future<void> setData(String key, dynamic value) async {
    var box = await Hive.openBox('appBox');
    debugPrint("HiveHelper: setData with key : $key and value : $value");
    await box.put(key, value);
  }

  static Future<dynamic> getData(String key) async {
    var box = await Hive.openBox('appBox');
    debugPrint("HiveHelper: getData with key : $key");
    return box.get(key);
  }

  static Future<void> removeData(String key) async {
    var box = await Hive.openBox('appBox');
    debugPrint("HiveHelper: data with key : $key has been removed");
    await box.delete(key);
  }

  static Future<void> clearAllData() async {
    var box = await Hive.openBox('appBox');
    debugPrint("HiveHelper: all data has been cleared");
    await box.clear();
  }

  static Future<void> setSecuredString(String key, String value) async {
    await setData(key, value);
  }

  static Future<String> getSecuredString(String key) async {
    return (await getData(key)) ?? '';
  }
   static Future<void> removeToken() async {
    var box = await Hive.openBox('appBox');
    await box.delete('auth_token');
  }
}
