import 'package:ebnsina/utils/app_const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferences? sharedPreferences;
  ThemeProvider({required this.sharedPreferences}) {
    _loadCurrentTheme();
    _loadCurrentLanguage();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences!.setBool(AppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  // void toggleSwitch(bool value) {
  //   if (_isSwitched == false) {
  //     _isSwitched = true;
  //     textValue = 'Switch Button is ON';
  //     print('Switch Button is ON');
  //     Get.find<ThemeController>().toggleTheme();
  //     update();
  //
  //   } else {
  //     _isSwitched = false;
  //     textValue = 'Switch Button is OFF';
  //     print('Switch Button is OFF');
  //     Get.find<ThemeController>().toggleTheme();
  //     update();
  //   }
  // }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences!.getBool(AppConstants.THEME) ?? false;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  int? _languageIndex;
  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);
  bool _isLtr = true;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int? get languageIndex => _languageIndex;

  void _loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences!.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.languages[0].languageCode!,
        sharedPreferences!.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages[0].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    notifyListeners();
  }

  void _saveLanguage(Locale locale) async {
    sharedPreferences!
        .setString(AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences!
        .setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }

  void setLanguage(Locale locale) {
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    AppConstants.languages.forEach((language) {
      if (language.languageCode == _locale.languageCode) {
        _languageIndex = AppConstants.languages.indexOf(language);
      }
    });

    _saveLanguage(_locale);
    notifyListeners();
  }

  String? get orderType => _orderType;
  String? _orderType = 'delivery';

  void setOrderType(String? type, {bool notify = true}) {
    _orderType = type;
    if (notify) {
      notifyListeners();
    }
  }
}
