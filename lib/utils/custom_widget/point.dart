import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../constant.dart';
import '../helper.dart';

class Point extends StatelessWidget {
  const Point({
    @required this.point,
    this.hasBorder: false,
    this.function,
  });

  final Function function;
  final double point;
  final bool hasBorder;
  @override
  Widget build(BuildContext context) {
    return this.hasBorder
        ? NeumorphicButton(
            onPressed: function,
            style: neumorphicStyleUpWithHighRadius,
            child: _showPoint(),
            padding: EdgeInsets.all(16),
          )
        : Padding(
            padding: EdgeInsets.all(16),
            child: _showPoint(),
          );
  }

  Widget _showPoint() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Neumorphic(
          style: neumorphicStyleDownCircle,
          child: Container(
            color: Colors.teal,
            height: 24,
            width: 24,
            alignment: Alignment.center,
            child: Text(
              'B',
            ),
          ),
        ),
        // CircleAvatar(
        //   child: Text('B'),
        //   backgroundColor: Colors.teal,
        //   radius: 12,
        // ),
        SizedBox(
          width: 8,
        ),
        Text(
          Helper.decimalPatternFormat(point),
          style: POINT_TEXT_STYLE,
        ),
      ],
    );
  }
}
