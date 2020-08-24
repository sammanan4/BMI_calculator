import 'package:flutter/material.dart';
import 'package:new_bmi_calculator/constants.dart';


class CustomSlider extends StatelessWidget{
  final double currentHeight, minVal, maxVal;
  final Function onChange;
  CustomSlider({this.currentHeight, this.maxVal, this.minVal, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: kActiveTrackColor,
        inactiveTrackColor: kInactiveTrackColor,
        thumbColor: kSliderThumbColor,
        overlayColor: kSliderThumbOverlayColor,
        trackHeight: 1.0,
        trackShape: RectangularSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
      ),
      child: Slider(
          value: currentHeight,
          min: minVal,
          max: maxVal,
          onChanged: onChange),
    );
  }
}
