import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/categories/categories_bloc.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_bloc.dart';
import 'package:promotion_platform/ui/authentication_screen.dart';
import 'package:promotion_platform/ui/login_screen.dart';
import 'package:promotion_platform/ui/splash_screen.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
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
        child: BlocProvider<CategoriesBloc>(
          bloc: CategoriesBloc(),
          child: BlocProvider<TopBrandsBloc>(
            bloc: TopBrandsBloc(),
            child: BlocProvider<TopPromotionsBloc>(
              bloc: TopPromotionsBloc(),
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
            ),
          ),
        ),
      ),
    );
  }
}
