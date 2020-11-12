// Author: Trung Shin
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../custom_colors.dart';

class Progressing extends StatelessWidget {
  // final double width;
  // Progressing({
  //   @required this.width,
  // });
  @override
  Widget build(BuildContext context) {
    return NeumorphicProgressIndeterminate(
      duration: Duration(milliseconds: 1000),
      style: ProgressStyle(
        lightSource: LightSource.topLeft,
        depth: 20,
        border: NeumorphicBorder(width: 0.8),
        accent: CustomColors.GREEN,
        gradientBorderRadius: BorderRadius.circular(50),
        borderRadius: BorderRadius.circular(50),
        variant: CustomColors.TEXT_COLOR,
      ),
    );
  }
}
