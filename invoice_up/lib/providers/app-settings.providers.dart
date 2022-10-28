import 'package:flutter/widgets.dart';
import 'package:invoice_up/interfaces/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _prefs;
  bool darkTheme = false;
  Locale locale = const Locale('pt');
  String? token;
  String? lastUser;

  AppSettings() {
    _startSessings();
  }

  Future<void> _startSessings() async {
    _prefs = await SharedPreferences.getInstance();
    darkTheme = getDarkTheme();
    locale = getLocale();
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

  String? getToken() {
    String? token = _prefs.getString('token');
    if (token == null) {
      return null;
    }
    return token;
  }

  void setToken(String token, String lastUser) async {
    await _prefs.setString('token', token);
    await _prefs.setString('lastUser', lastUser);
    token = token;
    lastUser = lastUser;
    notifyListeners();
  }
}
