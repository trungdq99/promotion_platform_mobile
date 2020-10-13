import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/custom_widget/point.dart';
import '../utils/custom_widget/brand_contact.dart';
import '../utils/custom_widget/show_detail.dart';
import '../utils/custom_widget/some_brand_info.dart';

class GiftDetailScreen extends StatefulWidget {
  @override
  _GiftDetailScreenState createState() => _GiftDetailScreenState();
}

class _GiftDetailScreenState extends State<GiftDetailScreen> {
  ScrollController _scrollController;
  double deviceWidth;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildAppBar(context),
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildTitle(
                    title: 'Voucher 500,000 VNĐ',
                    brand: 'Uni Delivery',
                    point: 1000,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 0,
                  ),
                  ShowDetail(
                    detail:
                        '- Voucher mệnh giá 500,000 VNĐ không giới hạn sản phẩm.\n'
                        'Lưu ý: Hạn sử dụng mã ưu đãi là 1 tuần kể từ ngày đổi.\n'
                        'Điều khoản & áp dụng:\n'
                        '* Áp dụng:\n'
                        '- Quý khách có thể sử dụng nhiều mã vouchẻ trên cùng 1 hoá đơn.\n'
                        '- Chỉ áp dụng khi khách hàng đưa mã voucher trên app Uni Bean cho nhân viên tại cửa hàng trước khi thanh toán.\n'
                        '- Được áp dụng đồng thời với các chương trình khuyến mãi khác.\n'
                        '* Không áp dụng:\n'
                        '- Không quy đổi thành tiền mặt, không hoàn trả tiền thừa.\n'
                        '- Khách hàng có thể được yêu cầu trả thêm tiền nếu sử dụng quá gía trị của voucher.',
                  ),
                  BrandContact(
                    email: 'unidelivery@gmail.com',
                    numOfStore: 7,
                    phone: '19001000',
                  ),
                  SomeBrandInfo(
                    brandTitle: 'Uni Delivery',
                    info: 'Hệ thống giao hàng cho sinh viên',
                  ),
                  SizedBox(
                    height: 72,
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 32,
            left: 32,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.teal,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              width: deviceWidth - 60,
              child: Text('Đổi quà'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle({
    String title,
    String brand,
    int point,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal,
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: BOLD_TITLE_TEXT_STYLE,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      brand,
                      style: DEFAULT_TEXT_STYLE,
                    ),
                    Point(
                      point: point,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        color: Colors.teal,
      ),
      expandedHeight: 150,
      leading: Padding(
        padding: EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black12,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
