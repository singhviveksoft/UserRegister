import 'dart:io';

import 'package:flutter/widgets.dart';

class UserRegisterProvider extends ChangeNotifier {
  File? image;
  int genderType = 1;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController mobNos = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController passwd = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  getGender(int value) {
    genderType = value;
    notifyListeners();
  }

  getPwdVisibility(bool visible) {
    passwordVisible = visible;
    notifyListeners();
  }

  getConfirmPwdVisibility(bool visible) {
    confirmPasswordVisible = visible;
    notifyListeners();
  }

  getSelectedImg(File imageSelected) {
    image = imageSelected;
    notifyListeners();
  }

  getMatchPwd(String pwd, String confirmPwd){
    passwd.text=pwd;
    confirmPass.text=confirmPwd;
    notifyListeners();
  }
}
