import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

import '../constant.dart';

class FullScreenProgressing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: CustomColors.TEXT_COLOR.withOpacity(0.5),
      child: Neumorphic(
        //style: neumorphicStyleUpWithSmallRadius,
        style: NeumorphicStyle(
          intensity: 0.5,
        ),
        child: Container(
          height: 100,
          width: width * 3 / 4,
          padding: EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 40,
          ),
          child: NeumorphicProgressIndeterminate(
            height: 8,
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
          ),
        ),
      ),
    );
  }
}
