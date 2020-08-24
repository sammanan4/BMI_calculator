import 'package:flutter/material.dart';

// Functionality Constants
enum Gender { male, female }
enum HeightMeasureUnit { cm, m, ft }
enum WeightMeasureUnit { kg, lbs }

const kMToIn = 39.37008,
    kCmToIn = 0.3937008,
    kCmToM = 0.01,
    kMToCm = 100.0,
    kKgToLbs = 1 / 0.453592,
    kLbsToKg = 0.453592;

const kMinCmValue = 100.0,
    kMinMValue = 1.0,
    kMaxCmValue = 220.0,
    kMaxMValue = 2.2;

// Card Component Design constants
const kDefaultCardColor = Color(0xFF111E23); // 0xFF111E23
const kCardMargin = 10.5;
const kBorderRadius = 10.0;


// Text Style Constants
const kFontFamily = 'trebuc';

const kDefaultLabelTextStyle = TextStyle(
  color: Color(0xFF00CCFF),
  fontFamily: kFontFamily,
  letterSpacing: 1.5,
);
const kInputValueTextStyle = TextStyle(
  color: Colors.white, // 0xFFFBC02D
  fontFamily: kFontFamily,
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);
const kMeasureUnitTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: kFontFamily,
  color: Colors.lightGreenAccent,  // 0xFF2196F3
);
const kResultRangeTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontFamily: kFontFamily,
);
const kBottomButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: kFontFamily,
  color: Colors.white,
  fontWeight: FontWeight.w900,
  letterSpacing: 1.5,
);

// Round Icon Button
const kRoundButtonIconColor = Colors.white;
const kRoundButtonIconBorderColor = Colors.black54;
const kRoundIconButtonFillColor = Color(0x00FFFFFF);
const kRoundIconButtonElevation = 15.0, kRoundIconButtonHoverElevation = 5.0;


// Slider
const kActiveTrackColor = Colors.deepOrange;
const kInactiveTrackColor = Color(0xFF00CCFF); //Colors.white24;
const kSliderThumbColor = Colors.red;
const kSliderThumbOverlayColor = Color(0x2900CCFF);


// Bottom Button
const kBottomButtonColor = Color(0xFF111E23); // 0xFF880000 //0xFF494949 0xFFAA2222
const kBottomButtonBorderColor = Colors.white;
const kBottomButtonWidthScale = 1.35;
const kBottomButtonElevation = 30.0;
const kBottomButtonBorderRadius = 10.0;

// input page constants
const kContentPadding = EdgeInsets.all(15.0);
const kInputValuePadding =
EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0);
