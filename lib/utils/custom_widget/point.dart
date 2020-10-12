import 'package:flutter/material.dart';
import '../constant.dart';

class Point extends StatelessWidget {
  const Point({
    Key key,
    @required this.point,
    this.hasBorder: false,
  }) : super(key: key);

  final int point;
  final bool hasBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: this.hasBorder
          ? BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            )
          : BoxDecoration(),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          CircleAvatar(
            child: Text('B'),
            backgroundColor: Colors.teal,
            radius: 12,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            point.toString(),
            style: DEFAULT_TEXT_STYLE,
          ),
        ],
      ),
    );
  }
}
