import 'package:flutter/material.dart';
import 'package:promotion_platform/ui/login_screen.dart';
import 'package:promotion_platform/ui/my_gift_screen.dart';
import './ui/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promotion Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      //home: HomeScreen(),
      home: LoginScreen(),
    );
  }
}
