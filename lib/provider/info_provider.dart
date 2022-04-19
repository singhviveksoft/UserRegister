import 'package:flutter/cupertino.dart';

class InfoProvider extends ChangeNotifier{
 String eduDropdown='Post Graduate';
 String yopDropdown='2015';
 String designationDropdown='Trainer';
 String domainDropdown='Testing';
  getEducation(String edu){
    eduDropdown=edu;
    notifyListeners();
  }
 getYOP(String year){
   yopDropdown=year;
   notifyListeners();
 }

 getDesignation(String designation){
   designationDropdown=designation;
   notifyListeners();
 }

 getDomain(String domain){
   domainDropdown=domain;
   notifyListeners();
 }
}