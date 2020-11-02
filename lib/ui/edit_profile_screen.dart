// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isSelectGender;
  @override
  void initState() {
    _isSelectGender = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAvatar(),
                _buildUsername(),
                _buildNameTextField(),
                _buildPhoneTextField(),
                _buildEmailTextField(),
                _buildBirthdayAndGender(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildUsername() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'User Name',
        style: HEADER_TEXT_STYLE,
      ),
    );
  }

  Widget _buildBirthdayAndGender() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Neumorphic(
            style: neumorphicStyleDownDefault,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '17/05/1999',
                prefixIcon: Neumorphic(
                  style: neumorphicStyleDownCircle,
                  child: Icon(
                    Icons.calendar_today,
                    size: 24,
                    color: CustomColors.TEXT_COLOR,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Neumorphic(
            style: neumorphicStyleDownDefault,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Giới tính',
                prefixIcon: Neumorphic(
                  style: neumorphicStyleDownCircle,
                  child: Icon(
                    Icons.people_alt_outlined,
                    size: 24,
                    color: CustomColors.TEXT_COLOR,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // child: NeumorphicButton(
          //   onPressed: () {
          //     setState(() {
          //       _isSelectGender = !_isSelectGender;
          //     });
          //   },
          //   style: _isSelectGender
          //       ? neumorphicStyleDownDefault
          //       : neumorphicStyleUpDefault,
          //   padding: EdgeInsets.all(16),
          //   margin: EdgeInsets.all(16),
          //   child: _isSelectGender
          //       ? Container()
          //       : Text(
          //           'Giới tính',
          //           textAlign: TextAlign.center,
          //         ),
          // ),
        ),
      ],
    );
  }

  Neumorphic _buildEmailTextField() {
    return Neumorphic(
      style: neumorphicStyleDownDefault,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          prefixIcon: Neumorphic(
            style: neumorphicStyleDownCircle,
            child: Icon(
              Icons.email,
              size: 24,
              color: CustomColors.TEXT_COLOR,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Neumorphic _buildPhoneTextField() {
    return Neumorphic(
      style: neumorphicStyleDownDefault,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Số điện thoại',
          prefixIcon: Neumorphic(
            style: neumorphicStyleDownCircle,
            child: Icon(
              Icons.phone,
              size: 24,
              color: CustomColors.TEXT_COLOR,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  NeumorphicButton _buildAvatar() {
    return NeumorphicButton(
      onPressed: () {},
      style: neumorphicStyleUpCircle,
      padding: EdgeInsets.all(0),
      child: Container(
        width: 184,
        height: 184,
        color: Colors.teal,
        child: Text('AVATAR'),
        alignment: Alignment.center,
      ),
    );
  }

  Row _buildNameTextField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Neumorphic(
            style: neumorphicStyleDownDefault,
            margin: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Tên',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Neumorphic(
            style: neumorphicStyleDownDefault,
            margin: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Họ',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return NeumorphicAppBar(
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () => Navigator.of(context).pop(),
        padding: EdgeInsets.all(0),
        child: Icon(
          Icons.close,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
      actions: [
        NeumorphicButton(
          style: neumorphicStyleUpCircle,
          onPressed: () {},
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.done,
            color: CustomColors.TEXT_COLOR,
            size: BIG_FONT_SIZE,
          ),
        ),
      ],
    );
  }
}
