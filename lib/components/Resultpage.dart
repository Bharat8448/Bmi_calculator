import 'package:bmi_calculator/screens/CalculatorBrain.dart';
import 'package:bmi_calculator/screens/Constants.dart';
import 'package:bmi_calculator/screens/Reusablecard.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';

class Resultpage extends StatelessWidget {
  Resultpage(this.bmiresult,this.interpretation,this.resulttext);
final String bmiresult;
final String resulttext;
final String  interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'YOUR RESULT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                color: kInActiveCardColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resulttext,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF24D876),
                      ),
                    ),
                    Text(
                      bmiresult,
                      style: TextStyle(
fontWeight: FontWeight.bold,
                        fontSize: 100.0,

                      ),
                    ),
                    Text(
                    interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    )

                  ],
                ),

              )
          ),
          Container(
            child: GestureDetector(
              onTap: (){

                Navigator.pop(context);
              },
              child:   Center(
                child: Text(
                  'ReCalculate',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFEB1555),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
