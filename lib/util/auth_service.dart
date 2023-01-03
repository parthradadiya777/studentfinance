import 'package:flutter/material.dart';

import '../model/User.dart';

class AuthService extends ChangeNotifier {
  bool _authenticated = false;
  String _idToken = '';
  User? _currentUser;
  bool get authenticated => _authenticated;
  String get idToken => _idToken;
  User? get currentUser => _currentUser;

  set authenticated(bool value) {
    _authenticated = value;
    notifyListeners();
  }

  set idToken(String idToken) {
    _idToken = idToken;
    notifyListeners();
  }

  set currentUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }
}
