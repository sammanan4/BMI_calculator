import 'package:flutter/material.dart';
import 'package:new_bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton(
      {@required this.icon,
      @required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: kRoundIconButtonElevation,
      hoverElevation: kRoundIconButtonHoverElevation,
      onPressed: onPressed,
      fillColor: kRoundIconButtonFillColor,
      shape: CircleBorder(
        side: BorderSide(
          color: kRoundButtonIconBorderColor,
        ),
      ),
      constraints: BoxConstraints.tightFor(
        width: 30.0,
        height: 30.0,
      ),
      child: Icon(
        icon,
        color: kRoundButtonIconColor,
        size: MediaQuery.of(context).size.height/30.0,
      ),
    );
  }
}
