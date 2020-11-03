import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
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
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocEventStateBuilder<AuthenticationState>(
      builder: (context, authenticationState) {
        if (authenticationState.isAuthenticated) {
          // WidgetsFlutterBinding.ensureInitialized()
          //     .addPostFrameCallback((timeStamp) {
          //   customerBloc
          //       .emitEvent(CustomerEventLoad(token: authenticationState.token));
          // });
          // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          //   customerBloc
          //       .emitEvent(CustomerEventLoad(token: authenticationState.token));
          // });
        }
        return _buildHomeScreen();
      },
      bloc: authenticationBloc,
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
          CupertinoTabView returnValue = _buildTabView(
            tabView: HomeTab(
              tabController: _tabController,
              homeContext: context,
            ),
            navKey: firstTabNavKey,
          );
          ;
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
                tabView: Scaffold(
                  body: Center(
                    child: Text('Scan'),
                  ),
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
