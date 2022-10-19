import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _prefs;
  bool darkTheme = false;

  AppSettings() {
    _startSessings();
  }

  Future<void> _startSessings() async {
    _prefs = await SharedPreferences.getInstance();
    darkTheme = getDarkThemeSharedPrerences();
  }

  void handleChangeDarkTheme() async {
    await _prefs.setBool('darkTheme', !darkTheme);
    darkTheme = !darkTheme;
    notifyListeners();
  }

  bool getDarkThemeSharedPrerences() {
    bool? isDarkTheme = _prefs.getBool('darkTheme');

    if (isDarkTheme == null) {
      return false;
    }
    return isDarkTheme;
  }
}
