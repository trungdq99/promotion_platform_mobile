// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/helper.dart';

class ConfirmWidget extends StatefulWidget {
  @override
  _ConfirmWidgetState createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<ConfirmWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.all(32),
        style: neumorphicStyleUpWithSmallRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bạn có chắc muốn đổi quà này?',
              style: DEFAULT_TEXT_STYLE,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: NeumorphicButton(
                    onPressed: () async {
                      await Helper.navigationDelay();
                      Navigator.pop(context);
                    },
                    style: neumorphicStyleUpCircle,
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: NeumorphicButton(
                    onPressed: () async {
                      await Helper.navigationDelay();
                      Navigator.pop(context, true);
                    },
                    style: neumorphicStyleUpCircle,
                    child: Icon(
                      Icons.check,
                      color: CustomColors.GREEN,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
