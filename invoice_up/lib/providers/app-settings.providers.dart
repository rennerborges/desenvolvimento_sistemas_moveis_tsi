import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:invoice_up/api/login.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _prefs;
  bool darkTheme = false;
  Locale locale = const Locale('pt');
  Auth? auth;
  String? lastUser;

  AppSettings() {
    _startSessings();
  }

  Future<void> _startSessings() async {
    _prefs = await SharedPreferences.getInstance();
    darkTheme = getDarkTheme();
    locale = getLocale();
    lastUser = getLastUser();
    notifyListeners();
  }

  void handleChangeDarkTheme() async {
    await _prefs.setBool('darkTheme', !darkTheme);
    darkTheme = !darkTheme;
    notifyListeners();
  }

  bool getDarkTheme() {
    bool? isDarkTheme = _prefs.getBool('darkTheme');

    if (isDarkTheme == null) {
      return false;
    }
    return isDarkTheme;
  }

  void setLocale(String locale) async {
    await _prefs.setString('locale', locale);
    this.locale = Locale(locale);
    notifyListeners();
  }

  Locale getLocale() {
    String? localeString = _prefs.getString('locale');
    if (localeString == null) {
      return const Locale('en');
    }
    return Locale(localeString);
  }

  String? getLastUser() {
    String? lastUser = _prefs.getString('lastUser');
    return lastUser;
  }

  Auth? getAuth() {
    String? authString = _prefs.getString('auth');

    if (authString == null) {
      return null;
    }
    Map<String, dynamic> authMap = jsonDecode(authString);

    return Auth.fromJson(authMap);
  }

  void setAuth(Auth auth) async {
    await _prefs.setString('auth', jsonEncode(auth.toJson()));
    await _prefs.setString('lastUser', auth.user);
    this.auth = auth;
    lastUser = auth.user;
    notifyListeners();
  }

  void logout() {
    _prefs.remove('auth');
    notifyListeners();
  }

  void setLastUser(String lastUser) async {
    await _prefs.setString('lastUser', lastUser);
    this.lastUser = lastUser;
    notifyListeners();
  }
}
