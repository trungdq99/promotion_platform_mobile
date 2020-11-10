// Author: Trung Shin
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

import '../constant.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final String hintText;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final int maxLength;
  final bool enable;
  CustomTextField({
    @required this.controller,
    this.prefixIcon,
    this.keyboardType: TextInputType.text,
    this.hintText: '',
    this.margin: const EdgeInsets.all(8),
    this.padding: const EdgeInsets.all(8),
    this.maxLength: 40,
    this.enable: true,
  });
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isEditing;
  @override
  void initState() {
    _isEditing = !widget.enable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (value) {
        if (widget.enable) {
          setState(() {
            _isEditing = value;
          });
        }
      },
      child: Neumorphic(
        style: _isEditing
            ? neumorphicStyleDownWithSmallRadius
            : neumorphicStyleUpWithSmallRadius,
        margin: widget.margin,
        padding: widget.padding,
        child: TextField(
          enabled: widget.enable,
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: SMALL_TEXT_STYLE,
            prefixIcon: widget.prefixIcon,
            counterText: '',
          ),
          textAlign: TextAlign.center,
          style: DEFAULT_TEXT_STYLE,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          cursorColor: CustomColors.GREEN,
        ),
      ),
    );
  }
}
