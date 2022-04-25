import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderRadioBox extends StatefulWidget {
  final int radioValue;
  final int groupValue;
  final Function(Object) onClick;
  const GenderRadioBox({Key? key,required this.radioValue,required this.groupValue,required this.onClick}) : super(key: key);

  @override
  _GenderRadioBoxState createState() => _GenderRadioBoxState();
}

class _GenderRadioBoxState extends State<GenderRadioBox> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 20,
      height: 10,
      child: Radio(

          value: widget.radioValue,
          groupValue:widget.groupValue,
          onChanged: (value) {
           widget.onClick.call(value!);


          }),
    );
  }
}
