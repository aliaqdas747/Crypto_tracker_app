import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  late ThemeMode themeMode;

  ThemeProvider(String theme){
    if(theme == "light"){
      themeMode = ThemeMode.light;

    }else{
      themeMode = ThemeMode.dark;
    }
  }

  void toggeleTheme(){
    if(themeMode == ThemeMode.light){
      themeMode = ThemeMode.dark;

    }else{
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}