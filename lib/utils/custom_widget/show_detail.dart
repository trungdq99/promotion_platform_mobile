import 'package:flutter/material.dart';

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
            height: (isShowMore || widget.detail.isEmpty) ? null : 200,
            padding: EdgeInsets.all(16),
            child: Text(
              widget.detail,
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
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
