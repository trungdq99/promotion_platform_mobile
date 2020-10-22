// Author: Trung Shin

import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
