import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/categories/categories_bloc.dart';
import 'package:promotion_platform/bloc/notification/notification_bloc.dart';
import 'package:promotion_platform/bloc/notification/notification_state.dart';
import 'package:promotion_platform/bloc/promotions/promotions_bloc.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_bloc.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_bloc.dart';
import 'package:promotion_platform/ui/authentication_screen.dart';
import 'package:promotion_platform/ui/login_screen.dart';
import 'package:promotion_platform/ui/splash_screen.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/custom_alert.dart';
import 'package:promotion_platform/utils/helper.dart';
import 'package:promotion_platform/utils/noti_helper.dart';
import './ui/home_screen.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  String payload;
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    payload = Helper.encodeJson(data);
  }
  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    NotiHelper.show(
        title: notification["title"],
        body: notification["body"],
        payload: payload);
  }
  return null;
}

class App extends StatelessWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void _handleGeneralMessage(Map<String, dynamic> message) {
    String payload;
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      payload = Helper.decodeJson(data);
    }
    final dynamic notification = message['notification'];
    NotiHelper.show(
        title: notification["title"],
        body: notification["body"],
        payload: payload);
  }

  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // _showItemDialog(message);
        _handleGeneralMessage(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
      },
    );
    return BlocProvider<AuthenticationBloc>(
      bloc: AuthenticationBloc(),
      child: BlocProvider<CustomerBloc>(
        bloc: CustomerBloc(),
        child: BlocProvider<CategoriesBloc>(
          bloc: CategoriesBloc(),
          child: BlocProvider<TopBrandsBloc>(
            bloc: TopBrandsBloc(),
            child: BlocProvider<TopPromotionsBloc>(
              bloc: TopPromotionsBloc(),
              child: BlocProvider<VouchersBloc>(
                bloc: VouchersBloc(),
                child: BlocProvider<PromotionsBloc>(
                  child: NeumorphicApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Promotion Platform',
                    themeMode: ThemeMode.light,
                    theme: NeumorphicThemeData(
                      baseColor: CustomColors.BACKGROUND_COLOR,
                      lightSource: LightSource.topLeft,
                      depth: 10,
                      intensity: 1,
                      borderColor: Color(0xfffffcfc),
                      borderWidth: 0.8,
                      boxShape: NeumorphicBoxShape.rect(),
                      buttonStyle: neumorphicStyleUpWithSmallRadius,
                      shadowLightColor: Colors.black12,
                    ),
                    darkTheme: NeumorphicThemeData(
                      baseColor: Color(0xFF3E3E3E),
                      lightSource: LightSource.topLeft,
                      depth: 6,
                    ),
                    // home: LoginScreen(),
                    // home: HomeScreen(),
                    home: SplashScreen(),
                  ),
                  bloc: PromotionsBloc(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
