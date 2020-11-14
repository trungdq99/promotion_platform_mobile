import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/helper.dart';

import './authentication_event.dart';
import './authentication_state.dart';
import '../../utils/bloc_helpers/bloc_event_state.dart';
import 'package:http/http.dart' show Response;

class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState(),
        );
  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AuthenticationEventGoogleSignIn) {
      await Future.delayed(Duration(milliseconds: 100));
      bool isSuccess = false;
      String errMsg = '';
      String token;
      yield AuthenticationState.authenticating();
      User user = await _handleGoogleSignIn().catchError((e) {
        errMsg = e.toString();
        _googleSignInError();
      });
      if (user != null) {
        IdTokenResult fbTokenResult = await user.getIdTokenResult(true);
        String firebaseToken = fbTokenResult.token;
        print(firebaseToken);
        token = await _signInSever(firebaseToken: firebaseToken);
        if (token != null && token.isNotEmpty) {
          Helper.saveData(
            ACCESS_TOKEN_KEY,
            token,
            SavingType.String,
          );
          isSuccess = true;
        } else {
          errMsg = 'Sign in sever failed!';
        }
      }
      if (!isSuccess) {
        yield AuthenticationState.error(errMsg: 'Something went wrong!');
        await _googleSignInError();
        await Future.delayed(Duration(seconds: 2));
        yield AuthenticationState.notAuthenticated();
      } else {
        print('Access token : $token');
        yield AuthenticationState.authenticated(token: token);
      }
    } else if (event is AuthenticationEventSignOut) {
      yield AuthenticationState.authenticating();
      await Future.delayed(Duration(milliseconds: 1000));
      _handleGoogleSignOut();
      yield AuthenticationState.notAuthenticated();
    } else if (event is AuthenticationEventLoadLogin) {
      yield AuthenticationState.authenticating();
      String token;
      token = await _loadToken();
      print('Token: $token');
      if (token != null && token.isNotEmpty) {
        yield AuthenticationState.authenticated(token: token);
      } else {
        yield AuthenticationState.notAuthenticated();
      }
    } else if (event is AuthenticationEventNotLogin) {
      await Future.delayed(Duration(milliseconds: 100));

      yield AuthenticationState.notAuthenticated();
    }
  }

  Future<String> _loadToken() async {
    String token = await Helper.loadData(ACCESS_TOKEN_KEY, SavingType.String);
    return token;
  }

  Future<String> _signInSever({@required String firebaseToken}) async {
    Repository _repository = Repository();
    Response response = await _repository.login(token: firebaseToken);
    print(response.statusCode);
    print(response.body);
    String token;
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        token = responseBody['token'];
      }
    }
    return token;
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    } else {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    }
  }

  Future _handleGoogleSignOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    Helper.removeData(ACCESS_TOKEN_KEY);
  }

  Future<void> _googleSignInError() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    // var tokenData = _loginContext.tokenData ?? (await UserRepo.getTokenData());
    // if (tokenData != null) {
    //   await UserRepo.clearTokenData();
    //   await _firebaseMessaging.unsubscribeFromTopic(tokenData["user_id"]);
    //   _loginContext.signOut();
    // }
  }
}
