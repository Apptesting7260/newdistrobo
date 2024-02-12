import 'package:shared_preferences/shared_preferences.dart';

class SharePrefence{
  Future<void> setStringData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString(key));
    return prefs.getString(key).toString();
  }
  Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("userId");

    await prefs.clear();
  }

}