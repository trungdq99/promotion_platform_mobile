import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/brand/brand_bloc.dart';
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/ui/splash_screen.dart';
import './bloc/promotion_detail_screen/promotion_detail_screen_bloc.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/ui/login_screen.dart';
import 'package:promotion_platform/ui/voucher_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/constant.dart';
import './ui/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: AuthenticationBloc(),
      child: BlocProvider<CustomerBloc>(
        bloc: CustomerBloc(),
        child: BlocProvider<BrandBloc>(
          bloc: BrandBloc(),
          child: BlocProvider<BrandDetailScreenBloc>(
            bloc: BrandDetailScreenBloc(),
            child: BlocProvider<PromotionDetailScreenBloc>(
              bloc: PromotionDetailScreenBloc(),
              child: NeumorphicApp(
                debugShowCheckedModeBanner: false,
                title: 'Promotion Platform',
                routes: listRoutes,
                themeMode: ThemeMode.light,
                theme: NeumorphicThemeData(
                  baseColor: Color.fromRGBO(236, 240, 243, 1),
                  lightSource: LightSource.topLeft,
                  depth: 20,
                  intensity: 1,
                ),
                darkTheme: NeumorphicThemeData(
                  baseColor: Color(0xFF3E3E3E),
                  lightSource: LightSource.topLeft,
                  depth: 6,
                ),
                home: LoginScreen(),
              ),
              // child: MaterialApp(
              //   title: 'Promotion Platform',
              //   debugShowCheckedModeBanner: false,
              //   theme: ThemeData(
              //     primaryColor: Colors.black,
              //   ),
              //   //home: HomeScreen(),
              //   //home: LoginScreen(),
              //   home: SplashScreen(),
              //   routes: listRoutes,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
