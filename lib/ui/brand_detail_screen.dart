import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/brand_contact.dart';
import 'package:promotion_platform/utils/custom_widget/show_detail.dart';
import 'package:promotion_platform/utils/custom_widget/voucher.dart';

class BrandDetailScreen extends StatefulWidget {
  @override
  _BrandDetailScreenState createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildTitle(
                  brandTitle: 'Uni Delivery',
                  email: 'unidelivery@gmail.com',
                  phone: '19001000',
                  numOfStore: 7,
                  type: 'Ẩm thực, ăn uống các thứ'),
              ShowDetail(
                detail: 'Hệ thống giao hàng cho sinh viên FPT\n'
                    '- Giao hàng tận nơi với mức giá phải chăng.\n'
                    '- Thức ăn luôn nóng hổi sẵn sàng ăn ngay, hoặc bạn có thể hâm lại bằng lò vi sóng ở 7/11\n'
                    'Hệ thống giao hàng cho sinh viên FPT\n'
                    '- Giao hàng tận nơi với mức giá phải chăng.\n'
                    '- Thức ăn luôn nóng hổi sẵn sàng ăn ngay, hoặc bạn có thể hâm lại bằng lò vi sóng ở 7/11\n'
                    'Hệ thống giao hàng cho sinh viên FPT\n'
                    '- Giao hàng tận nơi với mức giá phải chăng.\n'
                    '- Thức ăn luôn nóng hổi sẵn sàng ăn ngay, hoặc bạn có thể hâm lại bằng lò vi sóng ở 7/11\n',
              ),
              SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Voucher(
                        voucherTitle: 'Voucher 500,000 VND',
                        brandTitle: 'Uni Delivery',
                        price: 1000,
                      ),
                      Voucher(
                        voucherTitle: 'Voucher 500,000 VND',
                        brandTitle: 'Uni Delivery',
                        price: 1000,
                      ),
                      Voucher(
                        voucherTitle: 'Voucher 500,000 VND',
                        brandTitle: 'Uni Delivery',
                        price: 1000,
                      ),
                      Voucher(
                        voucherTitle: 'Voucher 500,000 VND',
                        brandTitle: 'Uni Delivery',
                        price: 1000,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
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
      pinned: true,
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

  Widget _buildTitle({
    String brandTitle,
    String email,
    String phone,
    int numOfStore,
    String type,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              brandTitle,
              style: BOLD_TITLE_TEXT_STYLE,
            ),
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.teal,
            ),
            trailing: Icon(Icons.star),
            subtitle: Row(
              children: [
                Icon(Icons.star),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '5.0',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ],
            ),
          ),
          BrandContact(
            phone: phone,
            numOfStore: numOfStore,
            email: email,
            type: type,
          ),
        ],
      ),
    );
  }
}
