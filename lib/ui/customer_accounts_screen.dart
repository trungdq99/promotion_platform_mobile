// Author: Trung Shin
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';
import 'package:promotion_platform/utils/helper.dart';

class CustomerAccountsScreen extends StatefulWidget {
  final int membershipCardId;
  CustomerAccountsScreen({@required this.membershipCardId});
  @override
  _CustomerAccountsScreenState createState() => _CustomerAccountsScreenState();
}

class _CustomerAccountsScreenState extends State<CustomerAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMembershipInfo(),
            _buildMembershipInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return NeumorphicAppBar(
      title: Text(
        'Danh sách tài khoản',
        style: HEADER_TEXT_STYLE,
      ),
      centerTitle: true,
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () async {
          await Helper.navigationDelay();
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(0),
        child: Icon(
          Icons.arrow_back_ios,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
    );
  }

  Widget _buildMembershipInfo() {
    return Neumorphic(
      style: neumorphicStyleDownWithSmallRadius,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(24),
      child: Table(
        children: [
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Mã tài khoản:',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Code',
                  style: BOLD_TITLE_TEXT_STYLE,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Tên tài khoản:',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Name',
                  style: BOLD_TITLE_TEXT_STYLE,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Point(
                  point: 1000,
                  hasBorder: false,
                ),
              ),
              NeumorphicButton(
                style: neumorphicStyleUpWithSmallRadius,
                onPressed: () {},
                child: Text(
                  'Lịch sử',
                  style: DEFAULT_TEXT_STYLE,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
