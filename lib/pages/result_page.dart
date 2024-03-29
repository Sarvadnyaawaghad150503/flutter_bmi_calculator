import 'package:bmi_calculator/components/Reusablecard.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/Reusablecard.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    required this.interpretation,
    required this.bmiResult,
    required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              // alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kresulttextstyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextstyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbodytextstyle,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
          ),
        ],
      ),
    );
  }
}
