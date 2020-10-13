import 'package:flutter/material.dart';

import '../constant.dart';

class ShowDetail extends StatefulWidget {
  final String detail;
  ShowDetail({
    @required this.detail,
  });
  @override
  _ShowDetailState createState() => _ShowDetailState(detail: this.detail);
}

class _ShowDetailState extends State<ShowDetail> {
  final String detail;
  _ShowDetailState({
    this.detail,
  });
  bool isShowMore = false;

  void _showMoreOrLess() {
    setState(() {
      isShowMore = !isShowMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _showMoreOrLess,
          child: Container(
            height: isShowMore ? null : 200,
            padding: EdgeInsets.all(16),
            child: Text(
              this.detail,
              style: DEFAULT_TEXT_STYLE,
            ),
          ),
        ),
        InkWell(
          onTap: _showMoreOrLess,
          child: Icon(
            isShowMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 32,
          ),
        ),
      ],
    );
  }
}
