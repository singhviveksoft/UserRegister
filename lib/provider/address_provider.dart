import 'package:flutter/cupertino.dart';

class AddressProvider extends ChangeNotifier{
  String stateDropdown='Maharashtra';
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();




  getState(String state){
    stateDropdown=state;
    notifyListeners();
  }
}