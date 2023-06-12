import 'dart:convert';




import 'package:car_rental/models/LoginModel.dart';
import 'package:car_rental/preferences/const.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrefRepository {
  Future<SharedPreferences> _getPref() => SharedPreferences.getInstance();
  final _const = PrefConst();

  clearPreferences() async {
    (await _getPref()).clear();
  }


  saveLoginData(LoginModel value) async {
    (await _getPref())
        .setString(_const.prefRegisterUser, json.encode(value));
  }

  Future<LoginModel> getLoginUserData() async {
    final data = (await _getPref()).getString(_const.prefRegisterUser);
    if (data != null && data.isNotEmpty) {
      return LoginModel.fromJson(json.decode(data));
    } else {
      return null;
    }
  }



}
