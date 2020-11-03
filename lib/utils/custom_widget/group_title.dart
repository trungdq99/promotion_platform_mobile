import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/constant.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({
    @required this.title,
    @required this.canShowAll,
    this.function,
  });

  final String title;
  final bool canShowAll;
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
            style: BOLD_TITLE_TEXT_STYLE,
          ),
          canShowAll
              ? InkWell(
                  onTap: function,
                  child: Text(
                    'Tất cả',
                    style: DEFAULT_TEXT_STYLE,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
