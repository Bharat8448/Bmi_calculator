import 'package:bmi_calculator/components/Resultpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/Reusablecard.dart';
import '../screens/Cardchild.dart';
import '../screens/Constants.dart';
import '../screens/CalculatorBrain.dart';

enum Gender{
  male,
  female,
}



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor=kActiveCardColor;
  Color femalecolor=kActiveCardColor;
   int height=180;
   int weight=60;
   int age=20;
  void changecolor(Gender g){
    if(g==Gender.male){
      if(malecolor==kActiveCardColor) {
        malecolor = kInActiveCardColor;
        femalecolor = kActiveCardColor;
      }else{
        malecolor==kActiveCardColor;
      }
    }else{
      if(femalecolor==kActiveCardColor) {
        femalecolor = kInActiveCardColor;
        malecolor = kActiveCardColor;
      }else{
        femalecolor==kActiveCardColor;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
               children: [

                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                 changecolor((Gender.male));
                       });
                     },
                     child: ReusableCard(
                         color: malecolor,
                       cardchild: childcard(
                         icon: FontAwesomeIcons.mars,
                         text: 'MALE',
                       ),
                     ),
                   ),
                 ),
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         changecolor((Gender.female));
                       });
                     },
                     child: ReusableCard(
                         color: femalecolor,
                       cardchild: childcard(
                         icon: FontAwesomeIcons.venus,
                         text: 'FEMALE',
                       ),
                     ),
                   ),
                 ),
               ],
            ),
          ),
         

        Expanded(
          child: ReusableCard(
              color: kInActiveCardColor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',style: ktextstyle,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: knumbertextstyle,
                    ),
                    Text(
                      'cm',
                          style: ktextstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  ),
                  child: Slider(
    value: height.toDouble(),
                      max: 240,
                      min: 120,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged:(double newvalue){
      setState(() {
        height=newvalue.round();
      });

                      }
                  ),
                ),
              ],
            ),
          ),
          
        ),


             
          
          Expanded(
            child: Row(
              children: [

                Expanded(
                  child: ReusableCard(color: kInActiveCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'WEIGHT',
                        style: ktextstyle,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
    Text(weight.toString(),
    style: knumbertextstyle,),
                          Text('kg',
                            style: ktextstyle,
                          ),

    ]
            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                         RoundIconButton(icon: FontAwesomeIcons.minus,
                           onpressed: (){
                             setState(() {
                               weight--;
                             });
                           },),
                        ],
                      )

                    ],
                  ),
                  ),
                ),
                Expanded(
                  child:ReusableCard(color: kInActiveCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: ktextstyle,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text(age.toString(),
                              style: knumbertextstyle,
                            ),
                            Text('yr',
                              style: ktextstyle,
                            ),

                          ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                                age--;
                              });
                            },),
                        ],
                      )

                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
          Container(
child: GestureDetector(
  onTap: (){
    Calculatorbrain calc=Calculatorbrain(weight: weight,height: height);

    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Resultpage(
          calc.CalculateBmi(),
          calc.getIntrepetation(),
          calc.getResult()
        );
      },
      ),
      );
    });
  },
  child:   Center(
    child: Text(
              'Calculate',
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
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onpressed});
  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


