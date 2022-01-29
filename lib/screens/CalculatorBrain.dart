import 'dart:math';
import 'package:flutter/material.dart';

class Calculatorbrain{
  Calculatorbrain({this.weight,this.height});
  final int height;
  final int weight;
  double _bmi;
  String CalculateBmi(){
   _bmi=weight/pow(height/100,2);
 return _bmi.toStringAsFixed(1);
  }
  String getIntrepetation(){
    if(_bmi>=25){
      return 'You are Overweight,Try to exercise more';
    }else if(_bmi>18.5) {
      return 'Good,You are normal';
    }
    else{
     return 'You are Underweight,try to gain Weight';
    }

  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>18.5) {
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }


}