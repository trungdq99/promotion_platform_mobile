import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final String token;
  SplashScreen({@required this.token});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(token),
      ),
    );
  }
}
