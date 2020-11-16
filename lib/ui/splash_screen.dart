import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/application_initialization/application_initialization_bloc.dart';
import 'package:promotion_platform/bloc/application_initialization/application_initialization_event.dart';
import 'package:promotion_platform/bloc/application_initialization/application_initialization_state.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_event.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/categories/categories_bloc.dart';
import 'package:promotion_platform/bloc/categories/categories_event.dart';
import 'package:promotion_platform/bloc/promotions/promotions_bloc.dart';
import 'package:promotion_platform/bloc/promotions/promotions_event.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_bloc.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_event.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_bloc.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_event.dart';
import 'package:promotion_platform/ui/authentication_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApplicationInitializationBloc _applicationInitializationBloc;
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
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final _topBrandsBloc = BlocProvider.of<TopBrandsBloc>(context);
    final _topPromotionsBloc = BlocProvider.of<TopPromotionsBloc>(context);
    final _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    final _promotionsBloc = BlocProvider.of<PromotionsBloc>(context);
    _authenticationBloc.emitEvent(AuthenticationEventLoadLogin());
    _topBrandsBloc.emitEvent(TopBrandsEventLoad());
    _topPromotionsBloc.emitEvent(TopPromotionsEventLoad());
    _categoriesBloc.emitEvent(CategoriesEventLoad());
    _promotionsBloc.emitEvent(
        PromotionsEventLoad(categoryId: 0, filterId: 0, pageId: 0, search: ''));
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
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Progressing(
                  // width: double.maxFinite,
                  ),
            ),
          );
        },
      ),
    );
  }
}
