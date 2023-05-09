import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  PageController homePageController = PageController();
  int _bottomNavigationPosition = 0;

  int get bottomNavigationPosition => _bottomNavigationPosition;

  set bottomNavigationPosition(int value) {
    _bottomNavigationPosition = value;
    notifyListeners();
  }
}
