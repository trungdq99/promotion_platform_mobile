import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_event.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/login_background.dart';
import 'package:promotion_platform/ui/home_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_alert.dart';
import 'package:promotion_platform/utils/custom_widget/icon/google_icon.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double deviceWidth;
  double deviceHeight;
  TextEditingController _textEditingController = TextEditingController();
  bool isLoginByPhone = false;
  AuthenticationBloc _authenticationBloc = AuthenticationBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return BlocEventStateBuilder<AuthenticationState>(
      builder: (context, state) {
        return _buildScreen(
          isProgressing: state.isAuthenticating,
          isError: state.isError,
          errMsg: state.message,
        );
      },
      bloc: _authenticationBloc,
    );
  }

  Widget _buildScreen({
    bool isProgressing,
    bool isError,
    String errMsg,
  }) {
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
            Container(
              child: login_background(),
              height: deviceHeight / 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // _buildLoginByPhoneButton(),
                isLoginByPhone
                    ? _buildConfirmButton()
                    : _buildLoginByGoogleButton(),
              ],
            ),
            isProgressing ? FullScreenProgressing() : Container(),
            isError
                ? CustomAlert(
                    errMsg: errMsg,
                  )
                : Container(),
            Positioned(
              bottom: MediaQuery.of(context).orientation == Orientation.portrait
                  ? deviceHeight / 6
                  : 20,
              child: _buildFunText(),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildFunText() {
    return Container(
      width: deviceWidth,
      margin: EdgeInsets.symmetric(vertical: 32),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: SMALL_TEXT_STYLE,
          children: [
            TextSpan(
              text: 'Nếu bạn chưa có số điện thoại thì ',
            ),
            TextSpan(
              text: 'Mua sim',
              style: TextStyle(
                color: CustomColors.GREEN,
                fontSize: DEFAULT_FONT_SIZE,
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginByPhoneButton() {
    return Neumorphic(
      margin: EdgeInsets.all(32),
      //padding: EdgeInsets.all(8),
      style: isLoginByPhone
          ? neumorphicStyleDownWithHighRadius
          : neumorphicStyleUpWithHighRadius,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }

  Widget _buildConfirmButton() {
    return NeumorphicButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => HomeScreen(),
        //   ),
        // );
      },
      style: neumorphicStyleUpWithHighRadius,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 32,
        ),
        child: Text(
          'Xác nhận',
          style: DEFAULT_TEXT_STYLE,
        ),
      ),
      margin: EdgeInsets.all(32),
    );
  }

  Widget _buildLoginByGoogleButton() {
    return NeumorphicButton(
      onPressed: () async {
        await Helper.navigationDelay();
        _authenticationBloc.emitEvent(AuthenticationEventGoogleSignIn());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoogleIcon(),
            SizedBox(
              width: 8,
            ),
            Text(
              'Đăng nhập bằng gmail',
              style: DEFAULT_TEXT_STYLE,
            ),
          ],
        ),
      ),
      style: neumorphicStyleUpWithHighRadius,
      margin: EdgeInsets.all(32),
    );
  }
}
