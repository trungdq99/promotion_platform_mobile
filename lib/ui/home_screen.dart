import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/categories/categories_bloc.dart';
import 'package:promotion_platform/bloc/categories/categories_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_bloc.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_state.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_bloc.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_state.dart';
import 'package:promotion_platform/ui/qrcode_scan_tab.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import './promotion_tab.dart';
import './notification_tab.dart';
import './profile_tab.dart';
import './home_tab.dart';
import '../utils/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CupertinoTabController _tabController;

  // Used to handle Android back button navigation with tab specific navigator.
  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    _tabController = CupertinoTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _customerBloc = BlocProvider.of<CustomerBloc>(context);
    return BlocEventStateBuilder<CustomerState>(
      builder: (context, customerState) {
        if (customerState.isLoading) {
          return Scaffold(
            body: FullScreenProgressing(),
            backgroundColor: CustomColors.BACKGROUND_COLOR,
          );
        } else if (customerState.isLoaded) {
          return _buildHomeScreen();
        } else {
          return Container(
            color: CustomColors.BACKGROUND_COLOR,
          );
        }
      },
      bloc: _customerBloc,
    );
  }

  Widget _buildHomeScreen() {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _currentNavigatorKey().currentState.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: CupertinoTabScaffold(
        controller: _tabController,
        tabBar: _buildTabBar(),
        tabBuilder: (context, index) {
          CupertinoTabView returnValue;

          switch (index) {
            case 0:
              returnValue = _buildTabView(
                tabView: HomeTab(
                  tabController: _tabController,
                  homeContext: context,
                ),
                navKey: firstTabNavKey,
              );
              break;
            case 1:
              returnValue = _buildTabView(
                tabView: PromotionTabScreen(
                  homeContext: context,
                ),
                navKey: secondTabNavKey,
              );
              break;
            case 2:
              returnValue = _buildTabView(
                tabView: QrCodeScanTab(
                  tabController: _tabController,
                ),
                navKey: thirdTabNavKey,
              );
              break;
            case 3:
              returnValue = _buildTabView(
                tabView: TabNotificationScreen(
                  homeContext: context,
                ),
                navKey: fourthTabNavKey,
              );
              break;
            case 4:
              returnValue = _buildTabView(
                tabView: TabProfileScreen(
                  homeContext: context,
                ),
                navKey: fifthTabNavKey,
              );
              break;
          }

          return returnValue;
        },
      ),
    );
  }

  CupertinoTabBar _buildTabBar() {
    return CupertinoTabBar(
      items: bottomNavigationBarItems,
      backgroundColor: CustomColors.BACKGROUND_COLOR,
      border: Border.all(style: BorderStyle.none),
    );
  }

  CupertinoTabView _buildTabView({
    @required Widget tabView,
    @required GlobalKey<NavigatorState> navKey,
  }) {
    return CupertinoTabView(
      navigatorKey: navKey,
      builder: (context) => tabView,
    );
  }

  GlobalKey<NavigatorState> _currentNavigatorKey() {
    switch (_tabController.index) {
      case 0:
        return firstTabNavKey;
      case 1:
        return secondTabNavKey;
      case 2:
        return thirdTabNavKey;
      case 3:
        return fourthTabNavKey;
      case 4:
        return fifthTabNavKey;
    }
    return firstTabNavKey;
  }
}
