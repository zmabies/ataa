
import 'package:flutter/material.dart';

import 'constants.dart';

class BuildGradientButton extends StatelessWidget {
  final String text; final VoidCallback onPressed;
  final double padding;
  final double radius;
  const BuildGradientButton({
    Key key, this.text, this.onPressed, this.padding, this.radius = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: Container(
            constraints: BoxConstraints.expand(height: 50),
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.lilac, AppColors.dustyBlue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 1]),
                borderRadius: BorderRadius.circular(radius)),
            child: Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: Dimens.semiLarge,
                        fontWeight: FontWeight.w500)))));
  }
}
