import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/Component71.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_event.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/googlehangouts.dart';
import 'package:promotion_platform/ui/home_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/error_alert.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double deviceWidth;
  double deviceHeight;
  TextEditingController _textEditingController;
  bool isLoginByPhone = false;
  AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return BlocEventStateBuilder<AuthenticationState>(
      builder: (context, state) {
        if (state.isAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          });
        }
        if (state.isError) {
          showDialog(
            builder: (context) => ErrorAlert(errMsg: state.errorMessage),
          ).whenComplete(() =>
              _authenticationBloc.emitEvent(AuthenticationEventSignOut()));
        }
        return _buildScreen(
          context,
          state.isAuthenticating,
        );
      },
      bloc: _authenticationBloc,
    );
  }

  Widget _buildScreen(
    BuildContext context,
    bool isProgressing,
  ) {
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
              child: Component71(),
              height: deviceHeight / 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginByPhoneButton(),
                isLoginByPhone
                    ? _buildConfirmButton()
                    : _buildLoginByGoogleButton(),
              ],
            ),
            isProgressing ? Progressing() : Container(),
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
      style: isLoginByPhone ? neumorphicStyleDown : neumorphicStyleUp,
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
      style: neumorphicStyleUp,
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
      onPressed: () {
        //_authenticationBloc.emitEvent(AuthenticationEventGoogleSignIn());
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
      style: neumorphicStyleUp,
      margin: EdgeInsets.all(32),
    );
  }
}
