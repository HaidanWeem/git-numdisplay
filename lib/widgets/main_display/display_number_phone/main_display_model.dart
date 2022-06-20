import 'package:display_num_phone/model/flag_code.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldButtonModel extends ChangeNotifier {
  FlagBack _flagCodeBox =
      FlagBack(flag: 'https://flagcdn.com/ua.svg', code: '+380');
  FlagBack get flagCodeBox => _flagCodeBox;

  final maskFormatter = MaskTextInputFormatter(mask: '(###) ###-####');
  final TextEditingController phoneNumberController = TextEditingController();

  bool _switcher = false;
  bool get switcher => _switcher;



  //Country button
  void chooseCountry(BuildContext context) async {
    _flagCodeBox =
        await Navigator.pushNamed(context, '/bottom_sheet') as FlagBack;
    notifyListeners();
  }

  //NextButton
  void lightSwitchButton(String? phoneNumber) {
    if (phoneNumber?.length == 14) {
      _switcher = true;
    } else {
      _switcher = false;
    }
    notifyListeners();
  }

  void onTapButtonNext() {
    if (_switcher == true) {
      print('You have pushed on the button Next');
    }
  }
}
