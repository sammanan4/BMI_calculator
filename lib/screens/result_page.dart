import 'package:flutter/material.dart';
import 'dart:math';
import 'package:new_bmi_calculator/components/card_component.dart';
import 'package:new_bmi_calculator/constants.dart';

String _range, _remarks;
double _bmiValue;
Color _rangeColor;

class BMIValue extends StatelessWidget {

  final double height, weight;
  final HeightMeasureUnit unitHeight;
  final WeightMeasureUnit unitWeight;

  BMIValue({this.weight, this.height, this.unitHeight, this.unitWeight}){
    calculateBMI();
    _getRangeAndRemarks();
  }

  void calculateBMI(){
    if (unitHeight == HeightMeasureUnit.m && unitWeight == WeightMeasureUnit.kg)
      _bmiValue = weight/pow(height, 2);
    else if (unitHeight == HeightMeasureUnit.cm && unitWeight == WeightMeasureUnit.kg)
      _bmiValue = weight/pow(height/100, 2);
    else if (unitHeight == HeightMeasureUnit.m && unitWeight == WeightMeasureUnit.lbs)
      _bmiValue = (weight * kLbsToKg)/pow(height, 2);
    else if (unitHeight == HeightMeasureUnit.cm && unitWeight == WeightMeasureUnit.lbs)
      _bmiValue = (weight * kLbsToKg)/pow(height/100, 2);
  }


  void _getRangeAndRemarks(){
    if (_bmiValue >= 18.5 && _bmiValue < 25){
      _range =  'NORMAL';
      _remarks = 'Congratulations ! You are in good health.';
      _rangeColor = Colors.green;
    }
    else if (_bmiValue <= 18.5){
      _range = 'UNDERWEIGHT';
      _remarks = 'You should consider a healthy diet.';
      _rangeColor = Colors.yellow;
    }
    else if (_bmiValue <= 30) {
      _range = 'OVERWEIGHT';
      _remarks = 'Maybe do some excercise before its too late !';
      _rangeColor = Colors.yellow;
    }
    else {
      _range = 'OBESE';
      _remarks = 'Get off your bed !';
      _rangeColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Result'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: CardComponent(
                colour: kDefaultCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _range,
                      style: kResultRangeTextStyle.copyWith(
                        color: _rangeColor,
                        fontSize: MediaQuery.of(context).size.width/11.0,
                      ),
                    ),
                    Text(
                      _bmiValue.toStringAsFixed(1),
                      style: kInputValueTextStyle.copyWith(
                        fontSize: MediaQuery.of(context).size.width/3.7,
                      ),
                    ),
                    Text(
                      _remarks,
                      textAlign: TextAlign.center,
                      style: kDefaultLabelTextStyle.copyWith(
                        fontSize: MediaQuery.of(context).size.width/15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}