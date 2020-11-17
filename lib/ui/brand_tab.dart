// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_bloc.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_state.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_bloc.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/models/voucher_model.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';
import 'package:promotion_platform/ui/voucher_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/brand_widget.dart';
import 'package:promotion_platform/utils/custom_widget/icon/search_icon.dart';
import 'package:promotion_platform/utils/custom_widget/icon/voucher_icon.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';
import 'package:promotion_platform/utils/helper.dart';

class BrandTab extends StatefulWidget {
  final BuildContext homeContext;
  BrandTab({@required this.homeContext});
  @override
  _BrandTabState createState() => _BrandTabState();
}

class _BrandTabState extends State<BrandTab> {
  CustomerBloc _customerBloc;
  TopBrandsBloc _topBrandsBloc;
  VouchersBloc _vouchersBloc;

  double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _topBrandsBloc = BlocProvider.of<TopBrandsBloc>(context);
    _vouchersBloc = BlocProvider.of<VouchersBloc>(context);

    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAppBar(),
                    _buildSearchTextField(),
                    _buildListBrand()
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Expanded(
          //           flex: 1,
          //           child: NeumorphicButton(
          //             style: neumorphicStyleUpWithSmallRadius,
          //             margin: EdgeInsets.all(16),
          //             onPressed: () async {
          //               await Helper.navigationDelay();
          //
          //               List result = await showModalBottomSheet(
          //                 context: context,
          //                 builder: (context) =>
          //                     SelectCategoryWidget(selectedIndex: _categoryId),
          //                 backgroundColor: CustomColors.BACKGROUND_COLOR,
          //               );
          //               if (result != null) {
          //                 bool isChange = result[1];
          //                 if (isChange) {
          //                   setState(() {
          //                     _categoryId = result[0];
          //                   });
          //                   _promotionsBloc.emitEvent(PromotionsEventLoad(
          //                     categoryId: _categoryId,
          //                     filterId: _filterId,
          //                     pageId: 0,
          //                     search: _searchController.text,
          //                   ));
          //                 }
          //               }
          //             },
          //             child: Text(
          //               CATEGORIES[_categoryId],
          //               style: DEFAULT_TEXT_STYLE,
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ),
          //         Expanded(
          //           flex: 1,
          //           child: NeumorphicButton(
          //             style: neumorphicStyleUpWithSmallRadius,
          //             margin: EdgeInsets.all(16),
          //             onPressed: () async {
          //               await Helper.navigationDelay();
          //
          //               List result = await showModalBottomSheet(
          //                 context: context,
          //                 builder: (context) =>
          //                     SelectFilterWidget(selectedIndex: _filterId),
          //                 backgroundColor: CustomColors.BACKGROUND_COLOR,
          //               );
          //               if (result != null) {
          //                 bool isChange = result[1];
          //                 if (isChange) {
          //                   setState(() {
          //                     _filterId = result[0];
          //                   });
          //                   _promotionsBloc.emitEvent(PromotionsEventLoad(
          //                     categoryId: _categoryId,
          //                     filterId: _filterId,
          //                     pageId: 0,
          //                     search: _searchController.text,
          //                   ));
          //                 }
          //               }
          //             },
          //             child: Text(
          //               FILTER[_filterId],
          //               style: DEFAULT_TEXT_STYLE,
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   bottom: 0,
          // ),
        ],
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
            child: BlocEventStateBuilder<CustomerState>(
              bloc: _customerBloc,
              builder: (context, state) {
                double balance;
                if (state.isLoaded) {
                  balance = state.customerModel.lastBalance;
                }
                return Point(
                  point: balance != null ? balance.toInt() : 0,
                  hasBorder: true,
                  function: () {},
                );
              },
            ),
            right: 16,
            top: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildMyGiftButton() {
    return BlocEventStateBuilder<VouchersState>(
      builder: (context, state) {
        List<VoucherModel> list;
        if (state.isLoaded) {
          list = state.listVoucherModel;
        }
        return Stack(
          children: [
            NeumorphicButton(
              style: neumorphicStyleUpWithHighRadius,
              onPressed: () async {
                await Helper.navigationDelay();
                Navigator.push(
                  widget.homeContext,
                  CupertinoPageRoute(
                    builder: (context) => VoucherScreen(),
                  ),
                );
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
                    list != null ? list.length.toString() : '0',
                    style: NUM_TEXT_STYLE,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      bloc: _vouchersBloc,
    );
  }

  Widget _buildSearchTextField() {
    return Neumorphic(
      style: neumorphicStyleDownDefault,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: TextField(
        // controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tìm kiếm Thương hiệu',
          enabled: false,
          suffixIcon: NeumorphicButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              // _promotionsBloc.emitEvent(PromotionsEventLoad(
              //   categoryId: _categoryId,
              //   filterId: _filterId,
              //   pageId: 0,
              //   search: _searchController.text,
              // ));
            },
            style: neumorphicStyleUpCircle,
            padding: EdgeInsets.all(0),
            child: SearchIcon(),
          ),
        ),
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
          // _promotionsBloc.emitEvent(PromotionsEventLoad(
          //   categoryId: _categoryId,
          //   filterId: _filterId,
          //   pageId: 0,
          //   search: _searchController.text,
          // ));
        },
      ),
    );
  }

  Widget _buildListBrand() {
    return BlocEventStateBuilder<TopBrandsState>(
      builder: (context, state) {
        List<BrandModel> listBrandModel;
        if (state.isLoad) {
          listBrandModel = state.listBrandModel;
          print(listBrandModel.length);
        }
        List<Widget> children = [];
        if (listBrandModel != null) {
          listBrandModel.forEach((element) {
            children.add(BrandWidget(
              brandId: element.id ?? 0,
              brandTitle: element.brandName ?? '',
              imageUrl: element.imgUrl ?? '',
              promotions: element.numberOfPromotion ?? 0,
              function: () async {
                await Helper.navigationDelay();
                Navigator.push(
                  widget.homeContext,
                  CupertinoPageRoute(
                    builder: (context) => BrandDetailScreen(
                      brandId: element.id,
                    ),
                  ),
                );
              },
            ));
          });
        }
        return listBrandModel != null && listBrandModel.length > 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: listBrandModel.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return BrandWidget(
                    brandId: listBrandModel[index].id ?? 0,
                    brandTitle: listBrandModel[index].brandName ?? '',
                    imageUrl: listBrandModel[index].imgUrl ?? '',
                    promotions: listBrandModel[index].numberOfPromotion ?? 0,
                    function: () async {
                      await Helper.navigationDelay();
                      Navigator.push(
                        widget.homeContext,
                        CupertinoPageRoute(
                          builder: (context) => BrandDetailScreen(
                            brandId: listBrandModel[index].id,
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            // ? GridView.count(
            //     crossAxisCount: 2,
            //     children: children,
            //   )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Empty list brand!'),
              );
      },
      bloc: _topBrandsBloc,
    );
  }
}
