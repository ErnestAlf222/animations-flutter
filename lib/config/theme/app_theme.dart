import 'package:flutter/material.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(useMaterial3: true);
  }
}

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  // 1. Indicador del themedata inicializar
  ThemeData _themeNow = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get themeNow => _themeNow;

  // * Incializar constructor con switch para tener un control absoluto
  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _themeNow = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _themeNow = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = false;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _themeNow = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    // 2. Condición para elegir tema oscuro o caso contrario
    if (value) {
      _themeNow = ThemeData.dark();
    } else {
      _themeNow = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    //3. Custom theme
    if (value) {
      _themeNow = ThemeData.light();
    } else {
      _themeNow = ThemeData.light();
    }
    notifyListeners();
  }
}
