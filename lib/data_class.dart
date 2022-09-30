import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DataClass extends ChangeNotifier {
  int _x = 0;
  int get x => _x;
  void incrementX() {
    _x++;
    // update();
    notifyListeners();
  }

  void decrementX() {
    _x--;
    // update();
    notifyListeners();
  }
}
