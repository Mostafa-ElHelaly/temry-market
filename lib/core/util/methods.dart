import 'package:shared_preferences/shared_preferences.dart';
import 'package:temry_market/core/services/services_locator.dart';

class Methods {
//singleton class
  Methods._internal();

  static final instance = Methods._internal();

  factory Methods() => instance;

  Future<void> clearAuth() async {
    SharedPreferences preference = sl();
    preference.remove("User Token Key");
    preference.remove("User Token Key");
    preference.remove("User Token Key");
  }

  Future<void> saveUserToken({String? authToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (authToken != null) {
      preferences.setString("User Token Key", authToken);
    } else {
      preferences.setString("User Token Key", authToken ?? "noToken");
    }
  }

  Future<String> returnUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenPref = preferences.getString("User Token Key") ?? "noToken";
    return tokenPref;
  }
}
