import 'package:flutter/material.dart';
import 'package:promotion_platform/ui/notification_detail_screen.dart';
import 'package:promotion_platform/utils/constant.dart';

class TabNotificationScreen extends StatefulWidget {
  @override
  _TabNotificationScreenState createState() => _TabNotificationScreenState();
}

class _TabNotificationScreenState extends State<TabNotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          flexibleSpace: SafeArea(
            child: TabBar(
              tabs: [
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.maxFinite,
                    //padding: EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.center,
                    child: Text('Thông báo'),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.center,
                    child: Text('Tin nhắn'),
                  ),
                ),
              ],
              unselectedLabelColor: Colors.black45,
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
              ),
              labelColor: Colors.teal,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              SingleChildScrollView(
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
              ),
              SingleChildScrollView(
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
              ),
            ],
          ),
        ),
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotificationDetailScreen(),
          ),
        );
      },
      child: Container(
        color: isRead ? Colors.white : Colors.black12,
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
