import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';

import '../constant.dart';

class FullScreenProgressing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Neumorphic(
        style: neumorphicStyleUpWithSmallRadius,
        padding: EdgeInsets.all(32),
        margin: EdgeInsets.all(32),
        child: Progressing(
            // width: width - 32,
            ),
      ),
    );
    // return Container(
    //   width: width,
    //   height: height,
    //   alignment: Alignment.center,
    //   color: CustomColors.TEXT_COLOR.withOpacity(0.5),
    //   child: Neumorphic(
    //     //style: neumorphicStyleUpWithSmallRadius,
    //     style: NeumorphicStyle(
    //       intensity: 0.5,
    //     ),
    //     child: Container(
    //       //height: 100,
    //       width: double.maxFinite,
    //       padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
    //       child: Progressing(
    //         width: double.maxFinite,
    //       ),
    //     ),
    //   ),
    // );
  }
}
