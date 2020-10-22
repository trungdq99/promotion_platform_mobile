import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/gift_detail_screen/gift_detail_screen_bloc.dart';
import 'package:promotion_platform/ui/login_screen.dart';
import 'package:promotion_platform/ui/my_gift_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import './ui/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: AuthenticationBloc(),
      child: BlocProvider<GiftDetailScreenBloc>(
        bloc: GiftDetailScreenBloc(),
        child: MaterialApp(
          title: 'Promotion Platform',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          //home: HomeScreen(),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
