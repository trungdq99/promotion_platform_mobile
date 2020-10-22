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
        token = await _signInSever(token: firebaseToken);
        if (token != null && token.isNotEmpty) {
          Helper.saveData(
            ACCESS_TOKEN_KEY,
            token,
            SavingType.String,
          );
          isSuccess = true;
          print(
              'Username: ${user.displayName} | Email: ${user.email} | Email verified: ${user.emailVerified} | Phone number: ${user.phoneNumber} | Photo url: ${user.photoURL}');
        } else {
          errMsg = 'Sign in sever failed!';
        }
      }
      if (!isSuccess) {
        yield AuthenticationState.error(errMsg: errMsg);
      } else {
        yield AuthenticationState.authenticated(token: token);
      }
    } else if (event is AuthenticationEventSignOut) {
      Helper.removeData(ACCESS_TOKEN_KEY);
      yield AuthenticationState.notAuthenticated();
    }
  }

  Future<String> _signInSever({@required String token}) async {
    Repository _repository = Repository();
    Response response = await _repository.login(token: token);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        return responseBody['token'];
      }
    }
    return null;
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
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
