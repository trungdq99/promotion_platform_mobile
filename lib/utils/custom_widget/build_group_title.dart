import 'package:flutter/material.dart';

class BuildGroupTitle extends StatelessWidget {
  const BuildGroupTitle({
    Key key,
    @required this.title,
    @required this.isShowAll,
    this.function,
  }) : super(key: key);

  final String title;
  final bool isShowAll;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
      ),
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          isShowAll
              ? Text(
                  'Tất cả',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
