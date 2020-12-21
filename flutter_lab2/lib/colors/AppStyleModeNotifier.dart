import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStyleModeNotifier extends ChangeNotifier {
  bool darkMode = false;
  Color text = BrandColors.text;
  Color champagne = BrandColors.champagne;
  Color apricot = BrandColors.apricot;
  Color fuzzy = BrandColors.fuzzy;
  Color mulberry = BrandColors.mulberry;
  Color purpureus = BrandColors.purpureus;
  Color background = BrandColors.background;
  Color accentedText = BrandColors.purpureus;
  Color shadedText = Colors.black12;

  switchMode(bool _setDarkMode) {
    bool setDarkMode = _setDarkMode == null ? false : _setDarkMode;
    if (setDarkMode == true) {
      _setDarkTheme();
    } else {
      _setLightTheme();
    }
    _saveToPrefs(setDarkMode).then((value) {
      darkMode = setDarkMode;
      notifyListeners();
    });
  }

  void _setDarkTheme() {
    text = BrandDarkColors.text;
    champagne = BrandDarkColors.champagne;
    apricot = BrandDarkColors.apricot;
    fuzzy = BrandDarkColors.fuzzy;
    mulberry = BrandDarkColors.mulberry;
    purpureus = BrandDarkColors.purpureus;
    background = BrandDarkColors.background;
    accentedText = BrandDarkColors.apricot;
    shadedText = BrandDarkColors.apricot;
  }

  void _setLightTheme() {
    text = BrandColors.text;
    champagne = BrandColors.champagne;
    apricot = BrandColors.apricot;
    fuzzy = BrandColors.fuzzy;
    mulberry = BrandColors.mulberry;
    purpureus = BrandColors.purpureus;
    background = BrandColors.background;
    accentedText = BrandColors.purpureus;
    shadedText = Colors.black12;
  }

  Future<void> _saveToPrefs(bool setDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', setDarkMode);
  }
}
