import 'package:flutter/material.dart';

class Level1Class extends ChangeNotifier {
  int _x = 0;
  int get x => _x;

  void increment() {
    _x++;
    notifyListeners();
  }

  void decrement() {
    _x--;
    notifyListeners();
  }

  void reset() {
    _x = 0;
    notifyListeners();
  }
}
