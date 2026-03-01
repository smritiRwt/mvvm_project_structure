import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', user.token ?? "123");
    notifyListeners();
    return true;
  }

  Future<UserModel?> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String token = sp.getString('token') ?? "null";
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    notifyListeners();
    return true;
  }
}
