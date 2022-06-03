import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerInfo extends ChangeNotifier {
  int _remainingSec = 15;
  int _min = 9;
  Color _color = Colors.black;

  // ignore: unused_element
  int getRemainingsec() => _remainingSec;
  int getRemainingmin() => _min;
  Color getColor() => _color;

  updateRemainingTime() {
    if (_remainingSec <= 11) {
      if (_remainingSec.isOdd) {
        _color = Colors.red;
      } else {
        _color = Colors.black;
      }
    }
    if (_remainingSec == 0) {
      _remainingSec = 20;
      _min++;
      _color = Colors.black;
    }

    _remainingSec--;
    notifyListeners();
  }
}
