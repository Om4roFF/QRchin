


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ApplicationProvider extends ChangeNotifier{

  String _lang = 'en';
  int _navigationMenuIndex = 1;
  bool _isDark = false;

  ApplicationProvider(this._isDark, this._lang);


  void setThemeMode(bool mode){
    this._isDark = mode;
    notifyListeners();
  }


  void setNavigationMenuIndex(int index){
    this._navigationMenuIndex = index;
    notifyListeners();
  }

  void setLang(String lang){
    this._lang = lang;
    notifyListeners();
  }

  String get getLang => this._lang;
  int get getNavigationIndex => this._navigationMenuIndex;
  bool get getDarkMode => this._isDark;
}