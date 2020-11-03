// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_text_field.dart';
import 'package:promotion_platform/utils/helper.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  final String birthday;
  final bool gender;

  EditProfileScreen({
    this.name,
    this.phone,
    this.email,
    this.birthday,
    this.gender,
  });
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isSelectGender = false;

  TextEditingController _firstNameController;
  TextEditingController _phoneController;
  TextEditingController _emailController;
  String _birthday;
  String _gender;
  @override
  void initState() {
    _firstNameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _emailController = TextEditingController(text: widget.email);
    _birthday = widget.birthday;
    if (widget.gender == null) {
      _gender = 'Giới tính';
    } else if (widget.gender) {
      _gender = 'Nam';
    } else {
      _gender = 'Nữ';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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

  Widget _buildUsername() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        widget.name,
        style: HEADER_TEXT_STYLE,
      ),
    );
  }

  Widget _buildBirthdayAndGender() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: NeumorphicButton(
            style: neumorphicStyleUpWithSmallRadius,
            margin: EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 16,
              right: 8,
            ),
            padding: EdgeInsets.all(8),
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                dateFormat: 'dd/MM/yyyy',
                onConfirm: (dateTime, selectedIndex) {
                  setState(() {
                    _birthday = Helper.formatDateTime(dateTime);
                  });
                },
                initialDateTime: Helper.convertStringToDateTime(_birthday),
              );
            },
            child: Row(
              children: [
                Neumorphic(
                  style: neumorphicStyleDownCircle,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(0),
                  child: Icon(
                    Icons.calendar_today,
                    size: 24,
                    color: CustomColors.TEXT_COLOR,
                  ),
                ),
                Expanded(
                  child: Text(
                    _birthday,
                    style: SMALL_TEXT_STYLE,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: NeumorphicButton(
            style: neumorphicStyleUpWithSmallRadius,
            margin: EdgeInsets.only(
              left: 8,
              top: 8,
              bottom: 16,
              right: 16,
            ),
            padding: EdgeInsets.all(8),
            onPressed: () {
              //Cupertiono
            },
            child: Row(
              children: [
                Neumorphic(
                  style: neumorphicStyleDownCircle,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(0),
                  child: Icon(
                    Icons.people_alt_outlined,
                    size: 24,
                    color: CustomColors.TEXT_COLOR,
                  ),
                ),
                Expanded(
                  child: Text(
                    _gender,
                    style: SMALL_TEXT_STYLE,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: _emailController,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: EdgeInsets.all(8),
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Neumorphic(
        style: neumorphicStyleDownCircle,
        child: Icon(
          Icons.email,
          size: 24,
          color: CustomColors.TEXT_COLOR,
        ),
      ),
    );
    // return Neumorphic(
    //   style: neumorphicStyleDownWithSmallRadius,
    //   margin: EdgeInsets.symmetric(
    //     horizontal: 16,
    //     vertical: 8,
    //   ),
    //   padding: EdgeInsets.all(8),
    //   child: TextField(
    //     controller: _emailController,
    //     decoration: InputDecoration(
    //       border: InputBorder.none,
    //       hintText: 'Email',
    //       hintStyle: SMALL_TEXT_STYLE,
    //       prefixIcon: Neumorphic(
    //         style: neumorphicStyleDownCircle,
    //         child: Icon(
    //           Icons.email,
    //           size: 24,
    //           color: CustomColors.TEXT_COLOR,
    //         ),
    //       ),
    //     ),
    //     textAlign: TextAlign.center,
    //     style: DEFAULT_TEXT_STYLE,
    //     keyboardType: TextInputType.emailAddress,
    //     cursorColor: Colors.teal,
    //   ),
    // );
  }

  Widget _buildPhoneTextField() {
    return CustomTextField(
      controller: _phoneController,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: EdgeInsets.all(8),
      hintText: 'Số điện thoại',
      keyboardType: TextInputType.phone,
      maxLength: 10,
      prefixIcon: Neumorphic(
        style: neumorphicStyleDownCircle,
        child: Icon(
          Icons.phone,
          size: 24,
          color: CustomColors.TEXT_COLOR,
        ),
      ),
    );
  }

  Widget _buildAvatar() {
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

  Widget _buildNameTextField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomTextField(
            controller: _firstNameController,
            margin: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 8,
              bottom: 8,
            ),
            padding: EdgeInsets.all(0),
            hintText: 'Tên',
            keyboardType: TextInputType.name,
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomTextField(
            controller: _firstNameController,
            margin: EdgeInsets.only(
              top: 16,
              left: 8,
              right: 16,
              bottom: 8,
            ),
            padding: EdgeInsets.all(0),
            hintText: 'Tên',
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return NeumorphicAppBar(
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () => Navigator.pop(context),
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
