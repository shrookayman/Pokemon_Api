import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String text;

  MyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text( text,
      style: TextStyle(
          fontSize: 15
      ),
    );
  }
}
