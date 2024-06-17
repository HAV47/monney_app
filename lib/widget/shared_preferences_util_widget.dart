import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<void> setUserData(String username, String firstName, String lastName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
  }
  static Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username'),
      'firstName': prefs.getString('firstName'),
      'lastName': prefs.getString('lastName'),
    };
  }
  static Future<double> getBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('balance') ?? 0.0;
  }

  static Future<void> setBalance(double balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);
  }

}