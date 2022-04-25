import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../provider/info_provider.dart';

class DropDownForm extends StatefulWidget {
 final String value;
final Function(String) onItemChange;
  final List<String> dropDownList;


  const DropDownForm({Key? key,required this.dropDownList,required this.value,required this.onItemChange}) : super(key: key);

  @override
  _DropDownFormState createState() => _DropDownFormState();
}

class _DropDownFormState extends State<DropDownForm> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.only(
          left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0)),
      child: DropdownButton<String>(
        value: widget.value,

        //  ask for position
        items: widget.dropDownList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
        widget.onItemChange.call(newValue!);
        },

        isExpanded: true,
        borderRadius:
        const BorderRadius.all(Radius.circular(20.0)),
      ),
    );
  }
}
