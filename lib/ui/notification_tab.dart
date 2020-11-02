import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/ui/notification_detail_screen.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

class TabNotificationScreen extends StatefulWidget {
  final BuildContext homeContext;
  TabNotificationScreen({
    @required this.homeContext,
  });
  @override
  _TabNotificationScreenState createState() =>
      _TabNotificationScreenState(homeContext: homeContext);
}

class _TabNotificationScreenState extends State<TabNotificationScreen>
    with SingleTickerProviderStateMixin {
  final BuildContext homeContext;
  _TabNotificationScreenState({
    @required this.homeContext,
  });
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NeumorphicColors.background,
        flexibleSpace: SafeArea(
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: NeumorphicButton(
                  style: _tabController.index == 0
                      ? neumorphicStyleDownWithHighRadius
                      : neumorphicStyleUpWithHighRadius,
                  onPressed: () {
                    setState(() {
                      _tabController.index = 0;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    width: double.maxFinite,
                    //padding: EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.center,
                    child: Text('Thông báo'),
                  ),
                ),
              ),
              Tab(
                child: NeumorphicButton(
                  style: _tabController.index == 1
                      ? neumorphicStyleDownWithHighRadius
                      : neumorphicStyleUpWithHighRadius,
                  onPressed: () {
                    setState(() {
                      _tabController.index = 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text('Tin nhắn'),
                  ),
                ),
              ),
            ],
            indicator: BoxDecoration(),
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildNoticeTab(),
            _buildMessageTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTab(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
            showMore: true,
            function: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotificationDetailScreen(),
                ),
              );
            },
          ),
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
            isRead: false,
            showMore: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNoticeTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
          ),
          _buildMessage(
              brandTitle: 'Uni Delivery',
              message:
                  'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
              date: 'Thứ Hai, 07:00',
              isRead: false),
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
          ),
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
          ),
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
          ),
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
          ),
          _buildMessage(
            brandTitle: 'Uni Delivery',
            message:
                'Thương hiệu bạn yêu thích có lời nhắn gửi cho bạn đấy. Kiếm tra tin nhắn nha',
            date: 'Thứ Hai, 07:00',
          ),
        ],
      ),
    );
  }

  Widget _buildMessage({
    String brandTitle,
    String message,
    String date,
    bool isRead: true,
    bool showMore: false,
    Function function,
  }) {
    return NeumorphicButton(
      onPressed: () {
        Navigator.of(homeContext).push(
          CupertinoPageRoute(
            builder: (context) => NotificationDetailScreen(),
          ),
        );
      },
      style: neumorphicStyleUpWithSmallRadius,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        color: isRead
            ? CustomColors.BACKGROUND_COLOR
            : CustomColors.TEXT_COLOR.withOpacity(0.5),
        width: double.maxFinite,
        height: 128,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    brandTitle,
                    style: BOLD_TITLE_TEXT_STYLE,
                  ),
                  Text(
                    message,
                    style: SMALL_TEXT_STYLE,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    date,
                    style: BOLD_SMALL_TEXT_STYLE,
                  ),
                ],
              ),
              flex: 7,
            ),
            Expanded(
              child: showMore ? Icon(Icons.more_vert) : Container(),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
