import 'package:flutter/cupertino.dart';

class SizeBetweenEditBox extends StatelessWidget {
  final double height;
  const SizeBetweenEditBox({Key? key, required  this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
    );
  }
}
