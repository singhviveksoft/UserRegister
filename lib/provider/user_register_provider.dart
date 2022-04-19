

import 'dart:io';

import 'package:flutter/widgets.dart';

class UserRegisterProvider extends ChangeNotifier{
  File? image;
  int genderType = 1;
  bool passwordVisible  = false;
  bool confirmPasswordVisible  = false;


  getGender( int value){
    genderType=value;
    notifyListeners();
  }
  getPwdVisibility(bool visible){
    passwordVisible=visible;
    notifyListeners();
  }

  getConfirmPwdVisibility(bool visible){
    confirmPasswordVisible=visible;
    notifyListeners();
  }
   getSelectedImg(File imageSelected){
    image=imageSelected;
    notifyListeners();
  }
}