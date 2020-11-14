import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class AuthenticationState extends BlocState {
  final bool isAuthenticated;
  final bool isAuthenticating;
  final String token;
  final bool isError;
  final String message;
  AuthenticationState({
    this.isAuthenticated: false,
    this.isAuthenticating: false,
    this.token: '',
    this.isError: false,
    this.message: '',
  });
  factory AuthenticationState.authenticated({@required String token}) {
    return AuthenticationState(
      isAuthenticated: true,
      token: token,
    );
  }

  factory AuthenticationState.notAuthenticated() {
    return AuthenticationState(
      isAuthenticated: false,
    );
  }

  factory AuthenticationState.authenticating() {
    return AuthenticationState(
      isAuthenticating: true,
    );
  }

  factory AuthenticationState.error({@required String errMsg}) {
    return AuthenticationState(
      isError: true,
      message: errMsg,
    );
  }
}
