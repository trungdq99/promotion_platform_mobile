import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/icon/game_icon.dart';
import 'package:promotion_platform/bloc/brand/brand_bloc.dart';
import 'package:promotion_platform/bloc/brand/brand_event.dart';
import 'package:promotion_platform/bloc/brand/brand_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/utils/custom_widget/ads_widget.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/ui/promotion_detail_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/helper.dart';
import '../utils/constant.dart';
import '../utils/custom_widget/point.dart';
import '../utils/custom_widget/group_title.dart';
import '../utils/custom_widget/promotion_widget.dart';

class HomeTab extends StatefulWidget {
  final CupertinoTabController tabController;
  final BuildContext homeContext;
  HomeTab({
    @required this.tabController,
    @required this.homeContext,
  });
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  double deviceWidth;
  CustomerBloc _customerBloc;
  BrandBloc _brandBLoc;
  CustomerModel _customerModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _brandBLoc = BlocProvider.of<BrandBloc>(context);
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    //   _brandBLoc.emitEvent(BrandEventLoadList());
    // });
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (_brandBLoc != null) _brandBLoc.emitEvent(BrandEventLoadList());
    // });
    deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return BlocEventStateBuilder<CustomerState>(
      builder: (context, state) {
        if (state.isLoad) {
          _customerModel = state.customerModel;
        }
        return Scaffold(
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAppBar(),
                      AdsWidget(),
                      GroupTitle(
                        title: 'Thương hiệu nổi bật',
                        canShowAll: true,
                      ),
                      _buildListBrand(),
                      GroupTitle(
                        title: 'Quà ngon được săn đón',
                        canShowAll: true,
                        function: () {
                          widget.tabController.index = 1;
                        },
                      ),
                      _buildListPromotion(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 64,
                right: 0,
                child: SafeArea(
                  child: Container(
                    height: 80,
                    width: 80,
                    child: NeumorphicButton(
                      onPressed: () {},
                      style: neumorphicStyleDownCircle,
                      child: GameIcon(),
                    ),
                  ),
                ),
              ),
              state.isLoading ? FullScreenProgressing() : Container(),
            ],
          ),
        );
      },
      bloc: _customerBloc,
    );
  }

  Function pushPromotionDetailScreen() => () async {
        await Helper.navigationDelay();
        Navigator.push(
          widget.homeContext,
          CupertinoPageRoute(
            builder: (context) => PromotionDetailScreen(),
          ),
        );
        // Navigator.of(widget.homeContext).push(MaterialPageRoute(
        //   builder: (context) => PromotionDetailScreen(),
        // ));
      };
  Widget _buildListPromotion() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          PromotionWidget(
            voucherTitle: 'Voucher 500,000 VND',
            brandTitle: 'Uni Delivery',
            price: 1000,
            function: pushPromotionDetailScreen(),
          ),
          PromotionWidget(
            voucherTitle: 'Voucher 500,000 VND',
            brandTitle: 'Uni Delivery',
            price: 1000,
            function: () {},
          ),
          PromotionWidget(
            voucherTitle: 'Voucher 500,000 VND',
            brandTitle: 'Uni Delivery',
            price: 1000,
          ),
          PromotionWidget(
            voucherTitle: 'Voucher 500,000 VND',
            brandTitle: 'Uni Delivery',
            price: 1000,
          ),
        ],
      ),
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
                  brandTitle: element.brandName ?? '',
                  promotions: 10,
                  brandId: element.id ?? 0,
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
          padding: EdgeInsets.all(8),
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

  Widget _buildAppBar({
    bool isProgressing: false,
  }) {
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
              Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: _customerModel != null
                    ? Image.network(
                        _customerModel.picUrl,
                        height: 68,
                        width: 68,
                      )
                    : Container(
                        height: 68,
                        width: 68,
                        color: CustomColors.GREEN,
                        alignment: Alignment.center,
                        child: Text('Avatar'),
                      ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Xin chào !',
                      style: DEFAULT_TEXT_STYLE,
                    ),
                    Text(
                      _customerModel != null
                          ? _customerModel.name
                          : 'User name',
                      style: BOLD_TITLE_TEXT_STYLE,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: Point(
              point: _customerModel != null ? _customerModel.lastBalance : 0,
              hasBorder: true,
              function: () {},
            ),
          ),
        ],
      ),
    );
  }

  // Show brand
  Widget _buildBrand({
    @required String brandTitle,
    int promotions: 0,
    String imageUrl: '',
    int brandId: 0,
  }) {
    return NeumorphicButton(
      onPressed: () async {
        await Helper.navigationDelay();
        // _brandDetailScreenBloc
        //     .emitEvent(BrandDetailScreenEventOpen(brandId: brandId));
      },
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(0),
      child: Container(
        width: 124,
        height: 124,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 124,
              height: 64,
              child: Image.network(
                'https://brasol.vn/public/uploads/1528692055-29.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                brandTitle,
                style: BOLD_SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '$promotions khuyến mãi',
                style: SMALL_TEXT_STYLE,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
