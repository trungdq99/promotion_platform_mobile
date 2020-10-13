import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/custom_back_button.dart';

class NotificationDetailScreen extends StatefulWidget {
  @override
  _NotificationDetailScreenState createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  ScrollController _scrollController;
  double maxScrollExtent = 0;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text('UNI'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Uni Delivery',
                    style: HEADER_TEXT_STYLE,
                  ),
                ],
              ),
              titleSpacing: 0,
              centerTitle: false,
              backgroundColor: Colors.white,
              leading: CustomBackButton(
                function: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _buildListMessage(),
              ]),
            ),
          ],
          controller: _scrollController,
        ),
      ),
    );
  }

  // List of message
  Widget _buildListMessage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
    return Column(
      children: [
        SizedBox(
          height: 32,
        ),
        _buildAvatar(),
        SizedBox(
          height: 16,
        ),
        Text(
          'Uni Delivery',
          style: HEADER_TEXT_STYLE,
        ),
        SizedBox(
          height: 32,
        ),
        _buildMessage(
          message:
              'yay! Chúc mừng bạn đã kích hoạt thành công gói quà từ Uni Delivery! Một voucher trị giá 500,000 VNĐ đang chờ được bạn sử dụng tại hệ thống cửa hàng của Uni Delivery nha. Còn chần chờ gì nữa mà không sử dụng ngay nào!',
          dateTime: 'Thứ Hai, 07:00',
          buttonTitle: 'Dùng ngay',
        ),
        _buildMessage(
          message:
              'yay! Chúc mừng bạn đã kích hoạt thành công gói quà từ Uni Delivery! Một voucher trị giá 500,000 VNĐ đang chờ được bạn sử dụng tại hệ thống cửa hàng của Uni Delivery nha. Còn chần chờ gì nữa mà không sử dụng ngay nào!',
          dateTime: 'Thứ Hai, 07:00',
          buttonTitle: 'Dùng ngay',
        ),
        _buildMessage(
          message:
              'yay! Chúc mừng bạn đã kích hoạt thành công gói quà từ Uni Delivery! Một voucher trị giá 500,000 VNĐ đang chờ được bạn sử dụng tại hệ thống cửa hàng của Uni Delivery nha. Còn chần chờ gì nữa mà không sử dụng ngay nào!',
          dateTime: 'Thứ Hai, 07:00',
          buttonTitle: 'Dùng ngay',
        ),
        _buildMessage(
          message:
              'yay! Chúc mừng bạn đã kích hoạt thành công gói quà từ Uni Delivery! Một voucher trị giá 500,000 VNĐ đang chờ được bạn sử dụng tại hệ thống cửa hàng của Uni Delivery nha. Còn chần chờ gì nữa mà không sử dụng ngay nào!',
          dateTime: 'Thứ Hai, 07:00',
          buttonTitle: 'Dùng ngay',
        ),
        _buildMessage(
          message:
              'yay! Chúc mừng bạn đã kích hoạt thành công gói quà từ Uni Delivery! Một voucher trị giá 500,000 VNĐ đang chờ được bạn sử dụng tại hệ thống cửa hàng của Uni Delivery nha. Còn chần chờ gì nữa mà không sử dụng ngay nào!',
          dateTime: 'Thứ Hai, 07:00',
          buttonTitle: 'Dùng ngay',
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.teal,
      radius: 32,
      child: Text('UNI'),
    );
  }

  Widget _buildMessage({
    String dateTime,
    String message,
    String buttonTitle,
    Function function,
  }) {
    return Column(
      children: [
        Text(
          dateTime,
          style: SMALL_TEXT_STYLE,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                message,
                style: DEFAULT_TEXT_STYLE,
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    buttonTitle,
                    style: DEFAULT_TEXT_STYLE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
