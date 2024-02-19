import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Reusablecard.dart';
import '../components/Icon_content.dart';
import '../components/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolour = kinactivecardcolour;
  Color femalecardcolour = kinactivecardcolour;
  int height = 180;
  int weight = 50;
  int age = 20;

  void updateColour(Gender selectedgender) {
    //male =1, female =2
    if (selectedgender == Gender.male) {
      if (malecardcolour == kinactivecardcolour) {
        malecardcolour = kactivecardcolor;
        femalecardcolour = kinactivecardcolour;
      } else {
        malecardcolour = kinactivecardcolour;
      }
    }

    if (selectedgender == Gender.female) {
      if (femalecardcolour == kinactivecardcolour) {
        femalecardcolour = kactivecardcolor;
        malecardcolour = kinactivecardcolour;
      } else {
        femalecardcolour = kinactivecardcolour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: malecardcolour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femalecardcolour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kactivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: knumberstyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kactivecardcolor,
                    cardChild: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   apply: () {
                            //     weight--;
                            //   },
                            // ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove_circle, // Changed to subtract icon
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              width: 10.0,
                            ),

                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons
                                    .add_circle, // The add icon remains unchanged
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactivecardcolor,
                    cardChild: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   apply: () {
                            //     weight--;
                            //   },
                            // ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove_circle, // Changed to subtract icon
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              width: 10.0,
                            ),

                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons
                                    .add_circle, // The add icon remains unchanged
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //     child: ReusableCard(
                //   colour: kactivecardcolor,
                //   cardChild: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //   ),
                // )),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kLargebuttonstyle,
                  ),
                ),
                margin: EdgeInsets.only(top: 1.0),
                padding: EdgeInsets.only(bottom: 10.0),
                // width: double.infinity,
                height: kbottomcontainerheight,
                decoration: BoxDecoration(
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    required this.icon,
    required this.apply,
  });

  final IconData icon;
  final Function apply;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // onPressed: () {
      //   print('recieved');
      // },
      onPressed: apply(),
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

// GestureDetector(
// onTap: () {
// setState(() {
// updateColour(Gender.female);
// });
// },)
// Container(
// margin: EdgeInsets.all(15.0),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0),),),
