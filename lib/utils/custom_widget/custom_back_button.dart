import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Function function;
  CustomBackButton({this.function});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
    );
  }
}
