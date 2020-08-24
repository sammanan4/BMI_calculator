import 'package:flutter/material.dart';
import '../constants.dart';


class CardComponent extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  final Function onCardTap;
  CardComponent({@required this.colour, this.cardChild, this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: EdgeInsets.all(kCardMargin),
        child: this.cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: this.colour,
        ),
      ),
    );
  }
}