import 'package:flutter/material.dart';
import 'package:new_bmi_calculator/components/height_manip.dart';
import 'package:new_bmi_calculator/components/calculate_button.dart';
import 'package:new_bmi_calculator/components/card_component.dart';
import 'package:new_bmi_calculator/components/round_icon_button.dart';
import 'package:new_bmi_calculator/components/custom_slider.dart';
import 'package:new_bmi_calculator/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  /* displayUnit is for display purpose
     if unit is to be displayed in cm, ft or m

     selectedUnit will only take values m or cm
     it is for the slider purpose
     it is convenient for slider to use simple values
     unlike feet and inch

     Similarly display height takes values only in m or cm
     which are then converted to feet and inch if required
     for display purpose only
  */
  HeightMeasureUnit selectedHeightUnit = HeightMeasureUnit.cm, displayHeightUnit = HeightMeasureUnit.cm;
  WeightMeasureUnit selectedWeightUnit = WeightMeasureUnit.kg;
  double displayHeight = 180.0, weight = 65;
  int feet = 5, inches = 11;

  void changeWeightUnit(){
    setState(() {
      if(selectedWeightUnit == WeightMeasureUnit.kg){
        selectedWeightUnit = WeightMeasureUnit.lbs;
        weight = ((weight * kKgToLbs)*100).truncateToDouble()/100.0;
        print(weight);
      }
      else{
        selectedWeightUnit = WeightMeasureUnit.kg;
        print(weight);
        weight = (weight * kLbsToKg).roundToDouble();
        print(weight);
      }
    });
  }


  void changeHeightUnitRight() {
    setState(() {
      if (displayHeightUnit == HeightMeasureUnit.cm && selectedHeightUnit == HeightMeasureUnit.cm) {
//        print('before in cm '+displayHeight.toString());
        selectedHeightUnit = HeightMeasureUnit.m;
        displayHeightUnit = HeightMeasureUnit.m;
        displayHeight = ((displayHeight * kCmToM)*100.0).roundToDouble()/100.0;
//        print('After in m '+displayHeight.toString());
      } else if (displayHeightUnit == HeightMeasureUnit.m && selectedHeightUnit == HeightMeasureUnit.m) {
        feet = (displayHeight * kMToIn) ~/ 12;
        inches = (displayHeight * kMToIn).toInt() % 12;
        displayHeightUnit = HeightMeasureUnit.ft;
      } else if(displayHeightUnit== HeightMeasureUnit.ft && selectedHeightUnit == HeightMeasureUnit.m){
        selectedHeightUnit = HeightMeasureUnit.cm;
        displayHeightUnit = HeightMeasureUnit.cm;
        displayHeight = (displayHeight * (kMToCm)).roundToDouble();
      }
      else if(displayHeightUnit == HeightMeasureUnit.ft && selectedHeightUnit == HeightMeasureUnit.cm)
        displayHeightUnit = HeightMeasureUnit.cm;
    });
  }

  void changeHeightUnitLeft() {
    setState(() {
      if (displayHeightUnit == HeightMeasureUnit.cm && selectedHeightUnit == HeightMeasureUnit.cm) {
        feet = (displayHeight * kCmToIn) ~/ 12;
        inches = (displayHeight * kCmToIn).toInt() % 12;
        displayHeightUnit = HeightMeasureUnit.ft;
      } else if (displayHeightUnit == HeightMeasureUnit.m && selectedHeightUnit == HeightMeasureUnit.m) {
        displayHeight = (displayHeight * kMToCm).roundToDouble();
        selectedHeightUnit = HeightMeasureUnit.cm;
        displayHeightUnit = HeightMeasureUnit.cm;
      } else if(displayHeightUnit == HeightMeasureUnit.ft && selectedHeightUnit == HeightMeasureUnit.cm) {
        displayHeight =
            ((displayHeight * kCmToM) * 100.0).roundToDouble() / 100.0;
        selectedHeightUnit = HeightMeasureUnit.m;
        displayHeightUnit = HeightMeasureUnit.m;
      }
        else if(displayHeightUnit == HeightMeasureUnit.ft && selectedHeightUnit == HeightMeasureUnit.m)
          displayHeightUnit = HeightMeasureUnit.m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        leading: Icon(
          Icons.accessibility_new,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          /* The Card Tiles */
          Expanded(
            flex: 7,
            child: Column(
              children: <Widget>[
                /* Height Card */
                Expanded(
                  child: CardComponent(
                    colour: kDefaultCardColor,
                    cardChild: Padding(
                      padding: kContentPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /* Height Card Label */
                          Text(
                            'HEIGHT',
                            style: kDefaultLabelTextStyle.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height / 22.0,
                            ),
                          ),

                          /* Height Value and Unit Changing Buttons */
                          ListTile(
                            contentPadding: kInputValuePadding,
                            /* Left Unit Change button */
                            leading: RoundIconButton(
                              icon: Icons.arrow_back_ios,
                              onPressed: this.changeHeightUnitLeft,
                            ),

                            /* Height Value and Unit */
                            title: displayHeightUnit == HeightMeasureUnit.ft
                                ? getImperialHeight(feet, inches, context)
                                : getMetricHeight(
                                    selectedHeightUnit, displayHeight, context),

                            /* Right Unit Change Button */
                            trailing: RoundIconButton(
                              icon: Icons.arrow_forward_ios,
                              onPressed: this.changeHeightUnitRight,
                            ),
                          ),

                          /* Slider Widget */
                          Flexible(
                            child: CustomSlider(
                              currentHeight: displayHeight,
                              minVal: minUnitValue(selectedHeightUnit),
                              maxVal: maxUnitValue(selectedHeightUnit),
                              onChange: (newHeight) {
                                setState(() {
                                  displayHeight = newHeight;
                                  if(selectedHeightUnit == HeightMeasureUnit.m){
                                    feet = (displayHeight * kMToIn) ~/ 12;
                                    inches = (displayHeight * kMToIn).toInt() % 12;
                                  }
                                  else{
                                    feet = (displayHeight * kCmToIn) ~/ 12;
                                    inches = (displayHeight * kCmToIn).toInt() % 12;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /* Weight Input Card */
                Expanded(
                  child: CardComponent(
                    colour: kDefaultCardColor,
                    cardChild: Padding(
                      padding: kContentPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /* Height Card Label */
                          Text(
                            'WEIGHT',
                            style: kDefaultLabelTextStyle.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height / 22.0,
                            ),
                          ),

                          /* Weight Value and Unit Changing Buttons */
                          ListTile(
                              contentPadding: kInputValuePadding,
                              dense: true,
                              /* Left Unit Change button */
                              leading: RoundIconButton(
                                icon: Icons.arrow_back_ios,
                                onPressed: this.changeWeightUnit,
                              ),

                              /* Weight Value and Unit */
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    selectedWeightUnit == WeightMeasureUnit.kg ?
                                    weight.toInt().toString()
                                    : weight.toStringAsFixed(1),
                                    style: kInputValueTextStyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              14.0,
                                    ),
                                  ),
                                  Text(
                                    selectedWeightUnit == WeightMeasureUnit.kg?
                                    ' kg' : ' lbs',
                                    style: kMeasureUnitTextStyle,
                                  ),
                                ],
                              ),

                              /* Right Unit Change Button */
                              trailing: RoundIconButton(
                                icon: Icons.arrow_forward_ios,
                                onPressed: this.changeWeightUnit,
                              )),

                          /* Slider Widget */
                          Flexible(
                            child: CustomSlider(
                              currentHeight: weight,
                              minVal: selectedWeightUnit == WeightMeasureUnit.kg ?
                              10.0: 22.04,
                              maxVal: selectedWeightUnit == WeightMeasureUnit.kg ?
                              175.0: 385.80927353216106,
                              onChange: (newWeight) {
                                setState(() {
                                  weight = newWeight;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /* The bottom button*/
          Expanded(
            flex: 1,
            child: CalculateButton(
              height: displayHeight,
              weight: weight,
              unitHeight: selectedHeightUnit,
              unitWeight: selectedWeightUnit,
            ),
          ),
        ],
      ),
    );
  }
}
