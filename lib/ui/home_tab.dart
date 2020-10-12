import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/custom_widget/point.dart';
import '../utils/custom_widget/group_title.dart';
import '../utils/custom_widget/voucher.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  double deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar(deviceWidth),
                  _buildAds(),
                  GroupTitle(
                    title: 'Thương hiệu nổi bật',
                    canShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildBrand(
                          brandTitle: 'Uni Delivery',
                          promotions: 10,
                        ),
                        _buildBrand(
                          brandTitle: 'Uni Delivery',
                          promotions: 10,
                        ),
                        _buildBrand(
                          brandTitle: 'Uni Delivery',
                          promotions: 10,
                        ),
                        _buildBrand(
                          brandTitle: 'Uni Delivery',
                          promotions: 10,
                        ),
                      ],
                    ),
                  ),
                  GroupTitle(
                    title: 'Quà ngon được săn đón',
                    canShowAll: true,
                  ),
                  SingleChildScrollView(
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
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 64,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text('Game'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAds() {
    return Container(
      child: Text('Quảng cáo'),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.all(8),
      height: 150,
      width: deviceWidth,
      margin: EdgeInsets.all(16),
    );
  }

  Widget _buildAppBar(double deviceWidth) {
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
              CircleAvatar(
                child: Text('Logo'),
                backgroundColor: Colors.teal,
                radius: 24,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning,',
                    style: DEFAULT_TEXT_STYLE,
                  ),
                  Text(
                    'User Name',
                    style: BOLD_TITLE_TEXT_STYLE,
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
            ),
          ),
        ],
      ),
    );
  }

  // Show brand
  Widget _buildBrand({
    @required String brandTitle,
    int promotions,
    String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(
        left: 16,
      ),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.teal,
            height: 64,
            width: 64,
            alignment: Alignment.center,
            child: Text('Uni'),
          ),
          Text(
            brandTitle,
            style: BOLD_TITLE_TEXT_STYLE,
          ),
          Text(
            '$promotions khuyến mãi',
            style: SMALL_TEXT_STYLE,
          ),
        ],
      ),
    );
  }
}
