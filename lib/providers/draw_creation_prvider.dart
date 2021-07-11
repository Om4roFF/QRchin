import 'package:flutter/material.dart';

class DrawCreateProvider extends ChangeNotifier {
  bool _isPublic = true;
  bool _isFirm = false;

  void setTypeOfDraw(bool type) {
    this._isPublic = type;
    notifyListeners();
  }

  void setTypeOfSponsor(bool type) {
    this._isFirm = type;
    notifyListeners();
  }

  bool get getTypeOfDraw => this._isPublic;
  bool get getTypeOfSponsor => this._isFirm;
}
