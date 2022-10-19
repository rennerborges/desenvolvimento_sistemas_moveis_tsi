import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _prefs;
  bool darkTheme = false;
  Locale locale = Locale('pt');

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
    print('Teste $localeString');
    if (localeString == null) {
      return const Locale('en');
    }
    return Locale(localeString);
  }
}
