import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/util/app_constant.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  ThemeProvider({@required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(AppConstant.THEME, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(AppConstant.THEME) ?? false;
    notifyListeners();
  }
}
