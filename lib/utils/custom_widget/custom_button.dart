// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      child: Text(
        'Nhập số điện thoại',
        style: DEFAULT_TEXT_STYLE,
      ),
      onPressed: () {},
      style: neumorphicStyleUpWithHighRadius,
    );
  }
}
