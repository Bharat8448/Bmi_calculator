import 'package:flutter/material.dart';
import 'Constants.dart';

class childcard extends StatelessWidget {
  childcard({this.icon,this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style:ktextstyle,
        )
      ],
    );
  }
}