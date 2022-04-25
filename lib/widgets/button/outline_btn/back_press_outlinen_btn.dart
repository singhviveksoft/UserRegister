import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousOutlinedBtn extends StatelessWidget {
  final Function onClick;
  final String btnText;
  final double? width;
  final double? height;

  const PreviousOutlinedBtn(
      {Key? key,
      required this.onClick,
      required this.btnText,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(width: 2.0, color: Colors.blue),
          ),
          onPressed: () {
            onClick.call();
          },
          child: Text(btnText),
        ));
  }
}
