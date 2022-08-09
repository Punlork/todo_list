import 'package:shared_preferences/shared_preferences.dart';

class TodoSharedPreferences {
  late SharedPreferences instant;

  init() async {
    instant = await SharedPreferences.getInstance();
  }
}
