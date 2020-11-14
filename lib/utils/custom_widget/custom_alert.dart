// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';

import '../helper.dart';

class CustomAlert extends StatefulWidget {
  final String errMsg;
  CustomAlert({
    @required this.errMsg,
  });

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _positionAnimation;
  Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
      ),
    );
    _controller.addListener(() async {
      if (_controller.isCompleted) {
        await Future.delayed(Duration(seconds: 2));
        _controller.reverse();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: SlideTransition(
        position: _positionAnimation,
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Neumorphic(
              style: neumorphicStyleForAlert,
              padding: EdgeInsets.all(32),
              child: Text(
                widget.errMsg,
                style: DEFAULT_TEXT_STYLE,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // title: Text(
          //   errMsg,
          //   style: DEFAULT_TEXT_STYLE,
          // ),
          // actions: [
          //   NeumorphicButton(
          //     margin: EdgeInsets.all(16),
          //     style: neumorphicStyleUpWithHighRadius,
          //     onPressed: function,
          //     child: Text('OK'),
          //   ),
          // ],
        ),
      ),
    );
  }
}
