import 'package:flutter/cupertino.dart';

class AddressProvider extends ChangeNotifier{
  String stateDropdown='Maharashtra';

  getState(String state){
    stateDropdown=state;
    notifyListeners();
  }
}