import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';

import '../constant.dart';

class FullScreenProgressing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        style: neumorphicStyleUpWithSmallRadius,
        padding: EdgeInsets.all(32),
        margin: EdgeInsets.all(32),
        child: Progressing(),
      ),
    );
  }
}
