// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';

class ErrorAlert extends StatelessWidget {
  final String errMsg;
  final Function function;
  ErrorAlert({
    @required this.errMsg,
    @required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        style: neumorphicStyleDownWithSmallRadius,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                errMsg,
                style: DEFAULT_TEXT_STYLE,
              ),
            ),
            NeumorphicButton(
              style: neumorphicStyleUpWithSmallRadius,
              padding: EdgeInsets.all(16),
              onPressed: function,
              child: Text(
                'OK',
                style: DEFAULT_TEXT_STYLE,
              ),
            ),
          ],
        ),
      ),
      // title: Text(
      //   errMsg,
      //   style: DEFAULT_TEXT_STYLE,
      // ),
      // actions: [
      //   NeumorphicButton(
      //     margin: EdgeInsets.all(16),
      //     style: neumorphicStyleUpWithHighRadius,
      //     onPressed: function,
      //     child: Text('OK'),
      //   ),
      // ],
    );
  }
}
