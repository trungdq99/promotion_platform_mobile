import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promotion_platform/ui/home_screen.dart';
import 'package:promotion_platform/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double deviceWidth;
  TextEditingController _textEditingController;
  bool isLoginByPhone = false;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isLoginByPhone = false;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginByPhoneButton(),
                isLoginByPhone
                    ? _buildConfirmButton()
                    : _buildLoginByGoogleButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginByPhoneButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
      ),
      width: deviceWidth,
      height: 56,
      margin: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 32,
      ),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nhập số điện thoại',
          hintStyle: DEFAULT_TEXT_STYLE,
          alignLabelWithHint: true,
          counterText: '',
        ),
        textAlign: TextAlign.center,
        style: DEFAULT_TEXT_STYLE,
        maxLength: 10,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.teal,
        controller: _textEditingController,
        onTap: () {
          setState(() {
            isLoginByPhone = true;
          });
        },
      ),
    );
  }

  Widget _buildConfirmButton() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Text(
          'Xác nhận',
          style: SMALL_TEXT_STYLE,
        ),
      ),
    );
  }

  Widget _buildLoginByGoogleButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
      ),
      width: deviceWidth,
      height: 56,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 32),
      alignment: Alignment.center,
      child: Text(
        'Đăng nhập bằng gmail',
        style: DEFAULT_TEXT_STYLE,
      ),
    );
  }
}
