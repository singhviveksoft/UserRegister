import 'dart:ui';

import 'package:flutter/cupertino.dart';

class HeaderTitleText  extends StatelessWidget {
  final String title;
  const HeaderTitleText({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
    title,
    style: TextStyle(
fontSize: 30.0, fontWeight: FontWeight.bold),
)
;
  }
}
