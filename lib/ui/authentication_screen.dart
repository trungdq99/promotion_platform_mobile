// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/brand/brand_bloc.dart';
import 'package:promotion_platform/bloc/brand/brand_event.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';

import '../ui/home_screen.dart';
import './login_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final _customerBloc = BlocProvider.of<CustomerBloc>(context);
    final _brandBloc = BlocProvider.of<BrandBloc>(context);
    return BlocEventStateBuilder<AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state.isAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _customerBloc
                .emitEvent(CustomerEventLoad(token: state.token));
            _brandBloc.emitEvent(BrandEventLoadList());
          });
          return HomeScreen();
        } else if (state.isAuthenticating) {
          return Scaffold(
            body: FullScreenProgressing(),
            backgroundColor: Colors.white,
          );
        } else {
          return LoginScreen();
        }
      },
      bloc: _authenticationBloc,
    );
  }
}