import 'package:flutter/material.dart';
import 'package:new_bmi_calculator/components/bottom_button.dart';
import 'package:new_bmi_calculator/screens/result_page.dart';
import 'package:new_bmi_calculator/constants.dart';

class CalculateButton extends StatelessWidget {
  final double height, weight;
  final HeightMeasureUnit unitHeight;
  final WeightMeasureUnit unitWeight;

  CalculateButton({
    @required this.height,
    @required this.weight,
    @required this.unitHeight,
    @required this.unitWeight});

  @override
  Widget build(BuildContext context) {
    return BottomButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                BMIValue(
                  height: height,
                  weight: weight,
                  unitHeight: unitHeight,
                  unitWeight: unitWeight,
                ),
          ),
        );
      },
      name: 'CALCULATE',
    );
  }
}
