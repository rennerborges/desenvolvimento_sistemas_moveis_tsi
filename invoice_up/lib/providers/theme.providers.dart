import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DarkTheme with ChangeNotifier, DiagnosticableTreeMixin {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void handleChange() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('darkTheme', darkTheme));
  }
}
