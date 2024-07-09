import 'package:flutter/cupertino.dart';

class SwitchProvider extends ChangeNotifier {
  bool switchOnOFF = true;

  onTapTrue() {
    switchOnOFF = true;
    notifyListeners();
  }

  onTapFalse() {
    switchOnOFF = false;
    notifyListeners();
  }
}
