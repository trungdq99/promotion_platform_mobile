import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class AuthenticationEvent extends BlocEvent {}

class AuthenticationEventGoogleSignIn extends AuthenticationEvent {}

class AuthenticationEventPhoneSignIn extends AuthenticationEvent {}

class AuthenticationEventSignOut extends AuthenticationEvent {}

class AuthenticationEventLoadLogin extends AuthenticationEvent {}
