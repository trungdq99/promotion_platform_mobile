import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/custom_widget/build_point.dart';

class TabProfileScreen extends StatefulWidget {
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
                  Container(
                    padding: EdgeInsets.all(16),
                    width: deviceWidth,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text('Avatar'),
                              backgroundColor: Colors.teal,
                              radius: 32,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
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
                          child: BuildPoint(
                            point: 1000,
                          ),
                        ),
                      ],
                    ),
                  ),
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

  Widget _buildButton({
    IconData iconData,
    String title,
    Function function,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListTile(
        leading: Icon(
          iconData,
        ),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      shape: Border.all(color: Colors.black),
    );
  }
}
