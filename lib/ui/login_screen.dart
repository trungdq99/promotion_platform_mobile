import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_event.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/ui/home_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
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
            // showDialog(
            //   builder: (context) => ErrorAlert(errMsg: state.errorMessage),
            // ).whenComplete(() =>
            //     _authenticationBloc.emitEvent(AuthenticationEventSignOut()));
          }
          return _buildScreen(
            context,
            state.isAuthenticating,
          );
        },
        bloc: _authenticationBloc);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginByPhoneButton(),
                isLoginByPhone
                    ? _buildConfirmButton()
                    : _buildLoginByGoogleButton(),
              ],
            ),
            Positioned(
              bottom: deviceHeight / 6,
              child: _buildFunText(),
            ),
            isProgressing ? Progressing() : Container(),
          ],
        ),
      ),
    );
  }

  Container _buildFunText() {
    return Container(
      width: deviceWidth,
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
                color: Colors.teal,
                fontSize: DEFAULT_FONT_SIZE,
                fontWeight: FontWeight.bold,
              ),
            ),
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
        height: 56,
        child: Text(
          'Xác nhận',
          style: DEFAULT_TEXT_STYLE,
        ),
      ),
    );
  }

  Widget _buildLoginByGoogleButton() {
    return InkWell(
      onTap: () {
        _authenticationBloc.emitEvent(AuthenticationEventGoogleSignIn());
      },
      child: Container(
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
      ),
    );
  }
}
