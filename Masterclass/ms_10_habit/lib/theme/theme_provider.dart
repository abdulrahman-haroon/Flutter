import 'package:flutter/material.dart';
import 'package:ms_10_habit/theme/dark_mode.dart';
import 'package:ms_10_habit/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initial
  ThemeData _themeData=lightMode;

  //get current theme
  ThemeData get themeData=>_themeData;

  //boolean

  bool get isDarkMode=>_themeData==darkMode;

  // set theme

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  //toggle
  void toggleTheme(){
    if(_themeData==lightMode){
      themeData=darkMode;
    }
    else{
      themeData=lightMode;
    }
  }
}