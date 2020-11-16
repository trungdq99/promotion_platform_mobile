import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_bloc.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_state.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';
import 'package:promotion_platform/utils/custom_widget/icon/game_icon.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_bloc.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_event.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/utils/custom_widget/ads_widget.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/ui/promotion_detail_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';
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
  TopBrandsBloc _topBrandsBloc;
  TopPromotionsBloc _topPromotionsBloc;
  CustomerModel _customerModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _topBrandsBloc = BlocProvider.of<TopBrandsBloc>(context);
    _topPromotionsBloc = BlocProvider.of<TopPromotionsBloc>(context);
    deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return BlocEventStateBuilder<CustomerState>(
      builder: (context, state) {
        if (state.isLoaded) {
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
                      _buildAppBar(isProgressing: state.isLoading),
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
            ],
          ),
        );
      },
      bloc: _customerBloc,
    );
  }

  Widget _buildListPromotion() {
    return BlocEventStateBuilder<TopPromotionsState>(
      builder: (context, state) {
        List<PromotionModel> listPromotions;
        List<Widget> children = [];
        if (state.isLoad) {
          listPromotions = state.listPromotion;
          listPromotions.forEach((element) {
            children.add(PromotionWidget(
              id: element.id,
              promotionName: element.promotionName,
              brandName: element.brandModel.brandName,
              imgUrl: element.imgUrl,
              price: element.price,
              function: () async {
                await Helper.navigationDelay();
                Navigator.push(
                  widget.homeContext,
                  CupertinoPageRoute(
                    builder: (context) => PromotionDetailScreen(
                      id: element.id,
                    ),
                  ),
                );
              },
            ));
          });
        }
        if (state.isLoading) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Progressing(),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(8),
          child: listPromotions != null
              ? Row(
                  children: children,
                )
              : Container(
                  child: Text(
                    'Empty list promotion',
                    style: DEFAULT_TEXT_STYLE,
                  ),
                ),
        );
      },
      bloc: _topPromotionsBloc,
    );
  }

  Widget _buildListBrand() {
    return BlocEventStateBuilder<TopBrandsState>(
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
                  promotions: element.numberOfPromotion,
                  brandId: element.id ?? 0,
                  imageUrl: element.imgUrl ?? '',
                ),
              );
            },
          );
        }
        if (state.isLoading) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Progressing(),
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
      bloc: _topBrandsBloc,
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
      child: !isProgressing
          ? Stack(
              children: [
                Row(
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: _customerModel != null
                          ? CustomNetworkImage(
                              imgUrl: _customerModel.picUrl,
                              width: 68,
                              height: 68,
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
                    point: _customerModel != null
                        ? _customerModel.lastBalance.toInt()
                        : 0,
                    hasBorder: true,
                    function: () {},
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Progressing(),
            ),
    );
  }

  // Show brand
  Widget _buildBrand({
    @required String brandTitle,
    int promotions: 0,
    String imageUrl: '',
    @required int brandId,
  }) {
    return NeumorphicButton(
      onPressed: () async {
        await Helper.navigationDelay();
        Navigator.push(
          widget.homeContext,
          CupertinoPageRoute(
            builder: (context) => BrandDetailScreen(
              brandId: brandId,
            ),
          ),
        );
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
            CustomNetworkImage(
              imgUrl: imageUrl,
              width: 124,
              height: 64,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                brandTitle,
                style: BOLD_SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
                textWidthBasis: TextWidthBasis.parent,
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
