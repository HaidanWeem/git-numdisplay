import 'package:flutter/material.dart';

class TextFieldButtonModel extends ChangeNotifier {
  bool switcher = false;

  void lightSwitchButton(String? phoneNumber) {
    if (phoneNumber?.length == 14) {
      switcher = true;
    } else {
      switcher = false;
    }
    notifyListeners();
  }
}

