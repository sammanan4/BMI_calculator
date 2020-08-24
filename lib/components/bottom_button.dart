import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String name;
  BottomButton({this.onTap, @required this.name});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: kBottomButtonElevation,
      shape: RoundedRectangleBorder(
            side: BorderSide(
              color: kBottomButtonBorderColor,
            ),
            borderRadius: BorderRadius.circular(kBottomButtonBorderRadius),
      ),
      fillColor: kBottomButtonColor,
      constraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width/kBottomButtonWidthScale,
      ),
      child: Text(
        name,
        style: kBottomButtonTextStyle,
      ),
    );
  }
}

//GestureDetector(
//onTap: onTap,
//child: Container(
//margin: EdgeInsets.only(top: 7.0),
//decoration: BoxDecoration(
//color: kBottomButtonColor,
//borderRadius: BorderRadius.only(
//topLeft: Radius.circular(30.0),
//topRight: Radius.circular(30.0),
//),
//),
//child: Center(
//child: Text(
//name,
//style: kBottomButtonTextStyle,
//),
//),
//),
//);
