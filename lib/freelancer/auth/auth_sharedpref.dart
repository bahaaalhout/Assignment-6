import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedpref {
  // static late SharedPreferences prefs;
  static const String userCred = 'isLogedin';

  // static init() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  // static Future<void> login(String email) async {
  //   prefs.setString(userCred, email);
  // }

  // static Future<void> signup(String email) async {
  //   prefs.setString(userCred, email);
  // }
}
