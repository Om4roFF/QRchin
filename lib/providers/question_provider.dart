import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';

class QuestionProvider extends ChangeNotifier {
  late List<ExpandableController> _controller;
  late ExpandableController _selectedController;
  late ExpandableController _unSelectedController;

  int _currentIndex = 0;

  QuestionProvider() {
    this._controller = <ExpandableController>[];
    _selectedController = ExpandableController()..expanded = true;
    _unSelectedController = ExpandableController()..expanded = false;
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  ExpandableController getController(int index) {
    if (index == this._currentIndex) {
      return _selectedController;
    } else {
      return _unSelectedController;
    }
  }

  void text() {
    for (var controller in _controller) {}
    notifyListeners();
  }
}
