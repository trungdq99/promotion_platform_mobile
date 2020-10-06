import 'package:flutter/material.dart';

class BuildPoint extends StatelessWidget {
  const BuildPoint({
    Key key,
    @required this.point,
  }) : super(key: key);

  final int point;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
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
          Text(point.toString()),
        ],
      ),
    );
  }
}
