import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.topLeft,
        child: Icon(Icons.arrow_back));
  }
}
