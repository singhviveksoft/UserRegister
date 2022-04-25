import 'package:flutter/cupertino.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 0.0, top: 8.0, right: 0.0, bottom: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
