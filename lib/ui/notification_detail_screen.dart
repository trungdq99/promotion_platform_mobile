import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
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
      appBar: NeumorphicAppBar(
        leading: NeumorphicButton(
          style: neumorphicStyleUpCircle,
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.TEXT_COLOR,
            size: BIG_FONT_SIZE,
          ),
        ),
        title: Row(
          children: [
            Neumorphic(
              style: neumorphicStyleDownCircle,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: Container(
                child: Text('UNI'),
                alignment: Alignment.center,
                color: Colors.teal,
                height: 54,
                width: 54,
              ),
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
      ),
      body: SafeArea(
        // child: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       pinned: true,
        //       title: Row(
        //         children: [
        //           CircleAvatar(
        //             backgroundColor: Colors.teal,
        //             child: Text('UNI'),
        //           ),
        //           SizedBox(
        //             width: 8,
        //           ),
        //           Text(
        //             'Uni Delivery',
        //             style: HEADER_TEXT_STYLE,
        //           ),
        //         ],
        //       ),
        //       titleSpacing: 0,
        //       centerTitle: false,
        //       backgroundColor: CustomColors.BACKGROUND_COLOR,
        //       leading: CustomBackButton(
        //         function: () {
        //           Navigator.of(context).pop();
        //         },
        //       ),
        //     ),
        //     SliverList(
        //       delegate: SliverChildListDelegate([
        //         _buildListMessage(),
        //       ]),
        //     ),
        //   ],
        //   controller: _scrollController,
        // ),
        child: _buildListMessage(),
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
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
      ),
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
        Neumorphic(
          style: neumorphicStyleDownWithSmallRadius,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          child: Container(
            child: Column(
              children: [
                Text(
                  message,
                  style: DEFAULT_TEXT_STYLE,
                ),
                SizedBox(
                  height: 16,
                ),
                NeumorphicButton(
                  style: neumorphicStyleUpWithHighRadius,
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Container(
                    color: CustomColors.GREEN,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      buttonTitle,
                      style: DEFAULT_TEXT_STYLE,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
