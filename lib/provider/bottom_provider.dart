import 'package:flutter/cupertino.dart';

class BottomProvider extends ChangeNotifier {
  int bottomIndex = 0;

  void bottomnavIndex(int index) {
    bottomIndex = index;
    notifyListeners();
  }
}
