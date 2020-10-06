import 'package:flutter/material.dart';
import '../utils/custom_widget/build_point.dart';
import '../utils/custom_widget/build_group_title.dart';
import '../utils/custom_widget/build_voucher.dart';

class TabHomeScreen extends StatefulWidget {
  @override
  _TabHomeScreenState createState() => _TabHomeScreenState();
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
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
                                Text('Good morning,'),
                                Text('User Name'),
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
                  Container(
                    child: Text('Quảng cáo'),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    padding: EdgeInsets.all(8),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(16),
                  ),
                  BuildGroupTitle(
                    title: 'Thương hiệu nổi bật',
                    isShowAll: true,
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
                  BuildGroupTitle(
                    title: 'Quà ngon được săn đón',
                    isShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildVoucher(
                          voucherTitle: 'Voucher 500,000 VND',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher 500,000 VND',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher 500,000 VND',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('$promotions khuyến mãi'),
        ],
      ),
    );
  }
}
