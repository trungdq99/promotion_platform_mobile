// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/constant.dart';

class ErrorAlert extends StatelessWidget {
  final String errMsg;
  ErrorAlert({@required this.errMsg});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: AlertDialog(
        title: Center(
          child: Text(
            errMsg,
            style: DEFAULT_TEXT_STYLE,
            textAlign: TextAlign.center,
          ),
        ),
        actionsPadding: EdgeInsets.only(
          right: 16,
          bottom: 16,
        ),
        actions: [
          GestureDetector(
            child: Text(
              'OK',
              style: SMALL_TEXT_STYLE,
            ),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
