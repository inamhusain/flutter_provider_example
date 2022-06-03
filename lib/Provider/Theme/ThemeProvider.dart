import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isThemeDark = false;
  bool get isThemeDark => _isThemeDark;

  changeTheme() {
    _isThemeDark = !_isThemeDark;
    // print(_isThemeDark);
    notifyListeners();
  }
}
