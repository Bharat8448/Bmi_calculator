import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({this.color,this.cardchild});
  final Color color;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}