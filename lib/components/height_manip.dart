import 'package:flutter/material.dart';
import '../constants.dart';

double minUnitValue(HeightMeasureUnit unit) {
  switch (unit) {
    case HeightMeasureUnit.cm:
      return kMinCmValue;
    case HeightMeasureUnit.m:
      return kMinMValue;
    default: return 0.0;
  }
}

double maxUnitValue(HeightMeasureUnit unit) {
  switch (unit) {
    case HeightMeasureUnit.cm:
      return kMaxCmValue;
    case HeightMeasureUnit.m:
      return kMaxMValue;
    default: return 0.0;
  }
}

String getDisplayHeight(HeightMeasureUnit unit,double height) {
  return unit == HeightMeasureUnit.cm
      ? height.toInt().toString()
      : height.toStringAsFixed(2);
}

String getMeasurementUnit(HeightMeasureUnit unit) {
  switch (unit) {
    case HeightMeasureUnit.cm:
      return ' cm';
    case HeightMeasureUnit.m:
      return ' m';
    default: return ' ';
  }
}

Row getMetricHeight(HeightMeasureUnit unit, double height, BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text(
        getDisplayHeight(unit, height),
        style: kInputValueTextStyle.copyWith(
          fontSize:
          MediaQuery.of(context).size.height / 13.0,
        ),
      ),
      Text(
        getMeasurementUnit(unit),
        style: kMeasureUnitTextStyle,
      ),
    ],
  );
}


Row getImperialHeight(int feet, int inches, BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text(
        feet.toString(),
        style: kInputValueTextStyle.copyWith(
          fontSize:
          MediaQuery.of(context).size.height / 13.0,
        ),
      ),
      Text(
        ' ft',
        style: kMeasureUnitTextStyle,
      ),
      Text(
        inches.toString(),
        style: kInputValueTextStyle.copyWith(
          fontSize:
          MediaQuery.of(context).size.height / 13.0,
        ),
      ),
      Text(
        ' in',
        style: kMeasureUnitTextStyle,
      ),
    ],
  );
}