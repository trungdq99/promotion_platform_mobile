import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/ui/edit_profile_screen.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';

class TabProfileScreen extends StatefulWidget {
  final BuildContext homeContext;
  TabProfileScreen({
    @required this.homeContext,
  });
  @override
  _TabProfileScreenState createState() => _TabProfileScreenState();
}

class _TabProfileScreenState extends State<TabProfileScreen> {
  double deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildAppBar(),
                  _buildButton(
                    title: 'Thành viên vàng',
                    iconData: Icons.leaderboard,
                  ),
                  _buildButton(
                    title: 'Quà đã đổi',
                    iconData: Icons.card_giftcard,
                  ),
                  _buildButton(
                    title: 'Lịch sử Bean',
                    iconData: Icons.history,
                  ),
                  _buildButton(
                    title: 'Thương hiệu',
                    iconData: Icons.shop,
                  ),
                  _buildButton(
                    title: 'Game',
                    iconData: Icons.videogame_asset,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildButton(
                    title: 'Về Uni Bean',
                  ),
                  _buildButton(
                    title: 'Hỗ trợ',
                    iconData: Icons.settings_input_svideo,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildButton(
                    title: 'Cài đặt',
                    iconData: Icons.settings,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      width: deviceWidth,
      child: Stack(
        children: [
          Row(
            children: [
              NeumorphicButton(
                style: neumorphicStyleUpCircle,
                onPressed: () {
                  Navigator.push(
                    widget.homeContext,
                    CupertinoPageRoute(
                      builder: (context) => EditProfileScreen(),
                      fullscreenDialog: true,
                    ),
                  );
                  // Navigator.of(homeContext).push(CupertinoPageRoute(
                  //   builder: (context) => EditProfileScreen(),
                  //   fullscreenDialog: true,
                  // ));
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 68,
                  width: 68,
                  alignment: Alignment.center,
                  color: Colors.teal,
                  child: Text('Avatar'),
                ),
              ),
              // CircleAvatar(
              //   child: Text('Avatar'),
              //   backgroundColor: Colors.teal,
              //   radius: 32,
              // ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: BOLD_TITLE_TEXT_STYLE,
                  ),
                  Text(
                    'Sửa thông tin',
                    style: TextStyle(color: Colors.teal),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: Point(
              point: 1000,
              hasBorder: true,
              function: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    IconData iconData: Icons.settings,
    String title: '',
    //Function function: const (){},
  }) {
    return NeumorphicButton(
      onPressed: () {},
      style: neumorphicStyleUpWithSmallRadius,
      margin: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 4,
      ),
      padding: EdgeInsets.all(16),
      child: Container(
        // height: ,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: DEFAULT_TEXT_STYLE,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: CustomColors.TEXT_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
