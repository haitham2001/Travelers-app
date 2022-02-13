import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier
{
  bool isDark = false;
  ThemeData theme = ThemeData.light();
  void changeAppMode()
  {
    isDark = !isDark;
    if (isDark)
      theme = ThemeData.dark();
    else
      theme = ThemeData.light();
    notifyListeners();
  }
}
