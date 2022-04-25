import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_register/util/fieldtype.dart';

import '../../util/email_validated.dart';

class TextFormFillWidget extends StatefulWidget {
  final String errorMsg;
  final String hintMsg;
  final TextEditingController editingController;
  final int? textLength;
  final TextInputType? inputType;
  final FieldType? fieldType;
  final IconData iconData;
  const TextFormFillWidget({Key? key,required this.errorMsg,required this.hintMsg,required this.editingController,required this.textLength, this.inputType,required  this.fieldType,required this.iconData}) : super(key: key);

  @override
  _TextFormFillWidgetState createState() => _TextFormFillWidgetState();
}

class _TextFormFillWidgetState extends State<TextFormFillWidget>  with InputValidationMixin{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      maxLength: widget.textLength,
      controller: widget.editingController,
      validator: (String? value) {

        switch(widget.fieldType){
          case FieldType.FNAME:
              if (!isNameValid(value!)) {
              return widget.errorMsg;
            }
              return null;


          case FieldType.LNAME:
            if (!isNameValid(value!)) {
              return widget.errorMsg;
            }
            return null;

          case FieldType.MOB:
            if (!isMobileValid(value!)) {
              return 'Plz enter 10 digit nos';
            }
            return null;

          case FieldType.EMAIL:
            if (!isEmailValid(value!)) {
              return 'Plz enter proper email';
            }
            return null;

          case FieldType.EXP:
            if (isEmptyValid(value!)) {
              return " Experience Can't be empty ";
            }
            return null;

          case FieldType.GRADE:
            if (isEmptyValid(value!)) {
              return " Grade Can't be empty ";
            }
            return null;




          case FieldType.ADDRESS:
            if (!isNameValid(value!)) {
              return widget.errorMsg;
            }
            return null;


          case FieldType.LANDMARK:
            if (!isNameValid(value!)) {
              return widget.errorMsg;
            }
            return null;


          case FieldType.CITY:
            if (!isNameValid(value!)) {
              return widget.errorMsg;
            }
            return null;


          case FieldType.PINCODE:
            if (!isPinCodeValid(value!)) {
              return widget.errorMsg;
            }
            return null;
        }



      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.red, width: 1)),
          prefixIcon:  Icon(
            widget.iconData,
            color: Colors.black,
          ),
          hintText: widget.hintMsg,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
