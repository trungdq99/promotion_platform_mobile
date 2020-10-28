import 'package:flutter/material.dart';
import 'package:promotion_platform/XDDown.dart';
import 'package:promotion_platform/XDUp.dart';
import 'package:promotion_platform/utils/custom_widget/custom_button.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.all(32),
              // width: 311,
              // height: 62,
              margin: EdgeInsets.all(16),
              child: XDUp(),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(16),

              //padding: EdgeInsets.all(32),
              //color: Colors.teal,
              // width: 311,
              // height: 62,
              child: XDDown(),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: CustomButton(),
            ),
          ],
        ),
      ),
    );
  }
}
