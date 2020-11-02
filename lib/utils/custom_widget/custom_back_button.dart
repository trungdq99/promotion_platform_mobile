import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';

class CustomBackButton extends StatelessWidget {
  final Function function;
  CustomBackButton({this.function});
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: function,
      style: neumorphicStyleUpCircle,
      padding: EdgeInsets.all(4),
      child: Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        child: Icon(
          Icons.arrow_back_ios,
          // color: Colors.grey,
          // size: 32,
        ),
      ),
    );
  }
}
