import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/brand/brand_bloc.dart';
import 'package:promotion_platform/bloc/brand/brand_event.dart';
import 'package:promotion_platform/bloc/brand/brand_state.dart';
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_bloc.dart';
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_event.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';
import '../bloc/promotion_detail_screen/promotion_detail_screen_bloc.dart';
import '../bloc/promotion_detail_screen/promotion_detail_screen_event.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';
import 'package:promotion_platform/ui/promotion_detail_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
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
  CustomerBloc _customerBloc;
  BrandBloc _brandBLoc;
  BrandDetailScreenBloc _brandDetailScreenBloc;
  @override
  Widget build(BuildContext context) {
    final _promotionDetailScreenBloc =
        BlocProvider.of<PromotionDetailScreenBloc>(context);
    _brandDetailScreenBloc = BlocProvider.of<BrandDetailScreenBloc>(context);
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _brandBLoc = BlocProvider.of<BrandBloc>(context);
    _brandBLoc.emitEvent(BrandEventLoadList());
    deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return BlocEventStateBuilder<CustomerState>(
      builder: (context, state) {
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
                      _buildListBrand(),
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
                              function: () =>
                                  _promotionDetailScreenBloc.emitEvent(
                                PromotionDetailScreenEventOpen(),
                              ),
                            ),
                            Voucher(
                              voucherTitle: 'Voucher 500,000 VND',
                              brandTitle: 'Uni Delivery',
                              price: 1000,
                              function: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PromotionDetailScreen(),
                              )),
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
                child: SafeArea(
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
              ),
              state.isLoading ? Progressing() : Container(),
            ],
          ),
        );
      },
      bloc: _customerBloc,
    );
  }

  Widget _buildListBrand() {
    return BlocEventStateBuilder<BrandState>(
      builder: (context, state) {
        List<BrandModel> listBrands;
        List<Widget> children = [];
        if (state.isLoad) {
          listBrands = state.listBrandModel;
          listBrands.forEach(
            (element) {
              children.add(
                _buildBrand(
                  brandTitle: element.brandName,
                  promotions: 10,
                  brandId: element.id,
                ),
              );
            },
          );
        }
        if (state.isLoading) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.teal,
            ),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: listBrands != null
              ? Row(
                  children: children,
                )
              : Container(
                  child: Text(
                    'Empty list brand',
                    style: DEFAULT_TEXT_STYLE,
                  ),
                ),
        );
      },
      bloc: _brandBLoc,
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
      child: BlocEventStateBuilder<CustomerState>(
        builder: (context, state) {
          CustomerModel customerModel;
          if (state.isLoad) {
            customerModel = state.customerModel;
          }
          return Stack(
            children: [
              Row(
                children: [
                  customerModel != null
                      ? CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(customerModel.picUrl),
                        )
                      : CircleAvatar(
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
                        customerModel != null
                            ? customerModel.name
                            : 'User Name',
                        style: BOLD_TITLE_TEXT_STYLE,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Point(
                  point:
                      customerModel != null ? customerModel.lastBalance : 1000,
                  hasBorder: true,
                ),
              ),
            ],
          );
        },
        bloc: _customerBloc,
      ),
    );
  }

  showBrandDetailScreen({@required int id}) =>
      _brandDetailScreenBloc.emitEvent(BrandDetailScreenEventOpen(brandId: id));

  // Show brand
  Widget _buildBrand({
    @required String brandTitle,
    int promotions,
    String imageUrl,
    int brandId,
  }) {
    return InkWell(
      onTap: () {
        _brandDetailScreenBloc
            .emitEvent(BrandDetailScreenEventOpen(brandId: brandId));
      },
      child: Container(
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
        width: 250,
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
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '$promotions khuyến mãi',
              style: SMALL_TEXT_STYLE,
            ),
          ],
        ),
      ),
    );
  }
}
