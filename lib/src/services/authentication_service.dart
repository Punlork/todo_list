import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/storage_util.dart';

import '../data/model/token/user_token.dart';

class AuthenticationService {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String?> _token;

  Future<void> saveToken(UserToken token) async {
    StorageUtil.setString('accessToken', token.accessToken);
    StorageUtil.setString('refreshToken', token.refreshToken);
  }

  Future<String?> checkToken() {
    _token = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('accessToken');
    });
    return _token;
  }

  // String? checkToken1() {
  //   String? token;
  //   token = StorageUtil.getString('accessToken');
  //   return token;
  // }

  Future<void> logout() async {
    StorageUtil.remove('accessToken');
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   final removed = await prefs.remove('accessToken');
    //   if (removed) {
    //     return true;
    //   } else {
    //     return false;
    //   }
  }
}
