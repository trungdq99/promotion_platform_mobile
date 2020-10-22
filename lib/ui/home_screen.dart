import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/gift_detail_screen/gift_detail_screen_bloc.dart';
import 'package:promotion_platform/bloc/gift_detail_screen/gift_detail_screen_event.dart';
import 'package:promotion_platform/bloc/gift_detail_screen/gift_detail_screen_state.dart';
import 'package:promotion_platform/ui/gift_detail_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import './gift_tab.dart';
import './notification_tab.dart';
import './profile_tab.dart';
import './home_tab.dart';
import '../utils/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CupertinoTabController _cupertinoTabController;

  @override
  void initState() {
    _cupertinoTabController = CupertinoTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final giftDetailScreenBloc = BlocProvider.of<GiftDetailScreenBloc>(context);
    return BlocEventStateBuilder<GiftDetailScreenState>(
      bloc: giftDetailScreenBloc,
      builder: (context, state) {
        if (state.isOpen) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => GiftDetailScreen(),
            ));
          });
        }
        return _buildHomeScreen();
      },
    );
  }

  Widget _buildHomeScreen() {
    return CupertinoTabScaffold(
      controller: _cupertinoTabController,
      tabBar: CupertinoTabBar(
        items: BOTTOM_NAVIGATION_BAR_ITEMS,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = _buildTabView(HomeTab());
            break;
          case 1:
            returnValue = _buildTabView(TabGiftScreen());
            break;
          case 2:
            returnValue = _buildTabView(Scaffold(
              body: Center(
                  child: FlatButton(
                child: Text('Click'),
                onPressed: () {
                  _cupertinoTabController.index = 1;
                },
              )),
            ));
            break;
          case 3:
            returnValue = _buildTabView(TabNotificationScreen());
            break;
          case 4:
            returnValue = _buildTabView(TabProfileScreen());
            break;
        }
        ;
        return returnValue;
      },
    );
  }

  CupertinoTabView _buildTabView(Widget tabView) {
    return CupertinoTabView(
      builder: (context) => tabView,
    );
  }
}
