import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/application_initialization/application_initialization_bloc.dart';
import 'package:promotion_platform/bloc/application_initialization/application_initialization_event.dart';
import 'package:promotion_platform/bloc/application_initialization/application_initialization_state.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_event.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/ui/authentication_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApplicationInitializationBloc _applicationInitializationBloc;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _applicationInitializationBloc = ApplicationInitializationBloc();
    _applicationInitializationBloc.emitEvent(ApplicationInitializationEvent(
      applicationInitializationEventType:
          ApplicationInitializationEventType.initialized,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _authenticationBloc.emitEvent(AuthenticationEventLoadLogin());
    return Scaffold(
      body: BlocEventStateBuilder<ApplicationInitializationState>(
        bloc: _applicationInitializationBloc,
        builder: (context, applicationInitializationState) {
          if (applicationInitializationState.isInitialized) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => AuthenticationScreen(),
                ),
              );
            });
          }
          return BlocEventStateBuilder<AuthenticationState>(
              builder: (context, authenticationState) {
                if (authenticationState.isAuthenticated) {}
                return Center(
                  child: Container(
                    height: 10,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: NeumorphicProgressIndeterminate(
                      duration: Duration(milliseconds: 1000),
                      style: ProgressStyle(
                        lightSource: LightSource.topLeft,
                        depth: 20,
                        border: NeumorphicBorder(width: 0.8),
                        accent: CustomColors.GREEN,
                        gradientBorderRadius: BorderRadius.circular(50),
                        borderRadius: BorderRadius.circular(50),
                        variant: CustomColors.TEXT_COLOR,
                      ),
                    ),
                  ),
                );
              },
              bloc: _authenticationBloc);
        },
      ),
    );
  }
}
