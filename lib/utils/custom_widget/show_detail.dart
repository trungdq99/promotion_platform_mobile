import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constant.dart';

class ShowDetail extends StatefulWidget {
  final String detail;
  ShowDetail({
    @required this.detail,
  });
  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  bool isShowMore = false;

  void _showMoreOrLess() {
    if (widget.detail.length > 40) {
      setState(() {
        isShowMore = !isShowMore;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeumorphicButton(
          onPressed: _showMoreOrLess,
          style: isShowMore
              ? neumorphicStyleDownDefault
              : neumorphicStyleUpDefault,
          padding: EdgeInsets.all(16),
          child: Text(
            widget.detail,
            style: DEFAULT_TEXT_STYLE,
            maxLines: isShowMore ? DefaultTextStyle.of(context).maxLines : 4,
          ),
        ),
        widget.detail.length >= 40
            ? InkWell(
                onTap: _showMoreOrLess,
                child: Icon(
                  isShowMore
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 32,
                ),
              )
            : SizedBox(),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
