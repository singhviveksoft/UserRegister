import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedBtnSubmit extends StatelessWidget {
  final Function onClick;
  final String btnText;
  final double? width;
  final double? height;
  const ElevatedBtnSubmit({Key? key,required this.onClick,required this.btnText, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(



          onPressed: (){
        onClick.call();
      }, child: Text(btnText)),
    );
  }
}
