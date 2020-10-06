import 'package:flutter/material.dart';
import '../utils/custom_widget/build_group_title.dart';
import '../utils/custom_widget/build_voucher.dart';
import '../utils/custom_widget/build_point.dart';

class TabGiftScreen extends StatefulWidget {
  @override
  _TabGiftScreenState createState() => _TabGiftScreenState();
}

class _TabGiftScreenState extends State<TabGiftScreen> {
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
                  BuildGroupTitle(
                    title: 'Đi ăn',
                    isShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                      ],
                    ),
                  ),
                  BuildGroupTitle(
                    title: 'Đi uống',
                    isShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                      ],
                    ),
                  ),
                  BuildGroupTitle(
                    title: 'Mua sắm',
                    isShowAll: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                        BuildVoucher(
                          voucherTitle: 'Voucher trị giá 500.000 VNĐ',
                          brandTitle: 'Uni Delivery',
                          price: 1000,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
          Positioned(
            bottom: 100,
            right: -10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildSelectType(),
                _buildSelectSort(),
              ],
            ),
          ),
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
                    _buildSortOption(title: 'Mới nhất', value: 0),
                    _buildSortOption(title: 'Cũ nhất', value: 1),
                    _buildSortOption(title: 'Bean từ cao đến thấp', value: 2),
                    _buildSortOption(title: 'Bean từ thấp đến cao', value: 3),
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

  Card _buildSortOption({
    @required String title,
    @required int value,
  }) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Radio(
          value: value,
          groupValue: _sortIndex,
        ),
        onTap: () {
          setState(() {
            _sortIndex = value;
          });
        },
      ),
    );
  }

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

  Padding _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: 'Search name, store, ...',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      width: _deviceWidth,
      child: Stack(
        children: [
          Container(
            width: 132,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  width: 124,
                  child: Row(
                    children: [
                      Icon(Icons.card_giftcard),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Quà đã đổi'),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    child: Text(
                      '10',
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Colors.teal,
                    radius: 12,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: BuildPoint(point: 1000),
            right: 0,
          ),
        ],
      ),
    );
  }
}
