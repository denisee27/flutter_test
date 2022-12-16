import 'package:cobain/models/user_model.dart';
import 'package:cobain/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    String email = '',
    String password = '',
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (error) {
      // ignore: avoid_print
      print("Error!");
      return false;
    }
  }
}
