import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_widget/icon/search_icon.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/icon/voucher_icon.dart';
import 'package:promotion_platform/utils/helper.dart';
import './voucher_screen.dart';
import '../utils/custom_widget/group_title.dart';
import '../utils/custom_widget/promotion_widget.dart';
import '../utils/custom_widget/point.dart';

class PromotionTabScreen extends StatefulWidget {
  final BuildContext homeContext;
  PromotionTabScreen({@required this.homeContext});
  @override
  _PromotionTabScreenState createState() => _PromotionTabScreenState();
}

class _PromotionTabScreenState extends State<PromotionTabScreen> {
  double _deviceWidth;

  bool _isShowTypeSelection = false;
  bool _isShowSortSelection = false;
  int _sortIndex = 0;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                if (_isShowTypeSelection) {
                  _isShowTypeSelection = false;
                }
                if (_isShowSortSelection) {
                  _isShowSortSelection = false;
                }
              });
            },
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar(),
                  _buildSearchTextField(),
                  GroupTitle(
                    title: 'Đi ăn',
                    canShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                      ],
                    ),
                  ),
                  GroupTitle(
                    title: 'Đi uống',
                    canShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                      ],
                    ),
                  ),
                  GroupTitle(
                    title: 'Mua sắm',
                    canShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                        PromotionWidget(
                          promotionName: 'Voucher trị giá 500.000 VNĐ',
                          brandName: 'Uni Delivery',
                          price: 1000,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
          // Positioned(
          //   bottom: 100,
          //   right: -10,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       _buildSelectType(),
          //       _buildSelectSort(),
          //     ],
          //   ),
          // ),
          // Positioned(
          //   bottom: 100,
          //   right: 0,
          //   child: _buildSelectSort(),
          // ),
        ],
      ),
    );
  }

  Widget _buildSelectSort() {
    return _isShowSortSelection
        ? Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isShowSortSelection = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.close,
                    color: Colors.teal,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                width: 200,
                //height: 200,
                child: Column(
                  children: [
                    // _buildSortOption(title: 'Mới nhất', value: 0),
                    // _buildSortOption(title: 'Cũ nhất', value: 1),
                    // _buildSortOption(title: 'Bean từ cao đến thấp', value: 2),
                    // _buildSortOption(title: 'Bean từ thấp đến cao', value: 3),
                  ],
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                _isShowSortSelection = true;
              });
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Mới nhất',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
  }

  // Card _buildSortOption({
  //   required String title,
  //   required int value,
  // }) {
  //   return Card(
  //     child: ListTile(
  //       title: Text(title),
  //       trailing: Radio(
  //         value: value,
  //         groupValue: _sortIndex,
  //         onChanged: (value) {
  //           setState(() {
  //             // _sortIndex = value;
  //           });
  //         },
  //       ),
  //       onTap: () {
  //         setState(() {
  //           _sortIndex = value;
  //         });
  //       },
  //     ),
  //   );
  // }

  Widget _buildSelectType() {
    return _isShowTypeSelection
        // If true, show selection
        ? Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isShowTypeSelection = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.close,
                    color: Colors.teal,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.fastfood,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.shop,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.videogame_asset,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        // If false, hide selection
        : GestureDetector(
            onTap: () {
              setState(() {
                _isShowTypeSelection = true;
              });
            },
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'All',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          );
  }

  Widget _buildSearchTextField() {
    return Neumorphic(
      style: neumorphicStyleDownDefault,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tìm kiếm',
          suffixIcon: NeumorphicButton(
            onPressed: () {},
            style: neumorphicStyleUpCircle,
            padding: EdgeInsets.all(0),
            child: SearchIcon(),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: _deviceWidth,
      child: Stack(
        children: [
          _buildMyGiftButton(),
          Positioned(
            child: Point(
              point: 1000,
              hasBorder: true,
              function: () {},
            ),
            right: 16,
            top: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildMyGiftButton() {
    return Stack(
      children: [
        NeumorphicButton(
          style: neumorphicStyleUpWithHighRadius,
          onPressed: () async {
            // await Helper.navigationDelay();
            // Navigator.push(
            //   widget.homeContext,
            //   CupertinoPageRoute(
            //     builder: (context) => MyGiftScreen(),
            //   ),
            // );
            // Navigator.of(homeContext).push(
            //   CupertinoPageRoute(
            //     builder: (context) => MyGiftScreen(),
            //   ),
            // );
          },
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(
            left: 16,
            bottom: 16,
            top: 16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              VoucherIcon(),
              SizedBox(
                width: 16,
              ),
              Text(
                'Quà của tui',
                style: BOLD_TITLE_TEXT_STYLE,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 4,
          child: Neumorphic(
            style: neumorphicStyleDownCircleForNum,
            child: Container(
              height: 32,
              width: 32,
              alignment: Alignment.center,
              color: CustomColors.GREEN,
              child: Text(
                '10',
                style: NUM_TEXT_STYLE,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
