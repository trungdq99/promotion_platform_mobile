import 'package:flutter/material.dart';

class Progressing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: AlertDialog(
        title: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
