import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/promotion_detail/promotion_detail_bloc.dart';
import 'package:promotion_platform/bloc/promotion_detail/promotion_detail_event.dart';
import 'package:promotion_platform/bloc/promotion_detail/promotion_detail_state.dart';
import 'package:promotion_platform/bloc/promotion_transaction/promotion_transaction_bloc.dart';
import 'package:promotion_platform/bloc/promotion_transaction/promotion_transaction_event.dart';
import 'package:promotion_platform/bloc/promotion_transaction/promotion_transaction_state.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_bloc.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_event.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_alert.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/helper.dart';
import '../utils/constant.dart';
import '../utils/custom_widget/point.dart';
import '../utils/custom_widget/brand_contact.dart';
import '../utils/custom_widget/show_detail.dart';
import '../utils/custom_widget/some_brand_info.dart';

class PromotionDetailScreen extends StatefulWidget {
  final int id;

  PromotionDetailScreen({@required this.id});
  @override
  _PromotionDetailScreenState createState() => _PromotionDetailScreenState();
}

class _PromotionDetailScreenState extends State<PromotionDetailScreen> {
  ScrollController _scrollController;
  double deviceWidth;
  PromotionDetailBloc _promotionDetailBloc;
  PromotionModel _promotionModel;
  PromotionTransactionBloc _promotionTransactionBloc;
  @override
  void initState() {
    super.initState();
    _promotionDetailBloc = PromotionDetailBloc();
    _promotionDetailBloc.emitEvent(PromotionDetailEventLoad(id: widget.id));
    _scrollController = ScrollController();
    _promotionTransactionBloc = PromotionTransactionBloc();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final _customerBloc = BlocProvider.of<CustomerBloc>(context);
    final _vouchersBloc = BlocProvider.of<VouchersBloc>(context);
    String token;
    if (_authenticationBloc.lastState.isAuthenticated) {
      token = _authenticationBloc.lastState.token;
    }
    return Scaffold(
      body: BlocEventStateBuilder<PromotionDetailState>(
        bloc: _promotionDetailBloc,
        builder: (context, promotionDetailState) {
          if (promotionDetailState.isLoaded) {
            _promotionModel = promotionDetailState.promotionModel;
          }
          return BlocEventStateBuilder<PromotionTransactionState>(
            builder: (context, promotionTransactionState) {
              if (token != null &&
                  token.isNotEmpty &&
                  promotionTransactionState.isTransacted) {
                _customerBloc.emitEvent(CustomerEventLoadBalance(token: token));
                _vouchersBloc.emitEvent(VouchersEventLoad(token: token));
              }
              return Stack(
                children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      _buildAppBar(),
                      _buildBody(),
                    ],
                  ),
                  promotionDetailState.isLoading
                      ? FullScreenProgressing()
                      : SizedBox(),
                  promotionTransactionState.isTransacting
                      ? FullScreenProgressing()
                      : SizedBox(),
                  promotionTransactionState.isError
                      ? CustomAlert(errMsg: promotionTransactionState.message)
                      : SizedBox(),
                  promotionTransactionState.isTransacted
                      ? CustomAlert(errMsg: promotionTransactionState.message)
                      : SizedBox(),
                  Positioned(
                    bottom: 0,
                    child: NeumorphicButton(
                      style: neumorphicStyleUpWithHighRadius,
                      onPressed: () async {
                        await Helper.navigationDelay();
                        if (token != null &&
                            token.isNotEmpty &&
                            _promotionModel != null) {
                          _promotionTransactionBloc
                              .emitEvent(PromotionTransactionEventTransact(
                            token: token,
                            voucherGroupId: _promotionModel.voucherGroupId,
                          ));
                        }
                      },
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(0),
                      child: Container(
                        width: deviceWidth - 64,
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        // color: CustomColors.GREEN,
                        child: Text(
                          'Đổi quà',
                          style: DEFAULT_TEXT_STYLE,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            bloc: _promotionTransactionBloc,
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return SliverList(
      delegate: SliverChildListDelegate([
        _buildTitle(
          title: _promotionModel != null ? _promotionModel.promotionName : '',
          brand: _promotionModel != null
              ? _promotionModel.brandModel.brandName
              : '',
          point: _promotionModel != null ? _promotionModel.price : 0,
          brandPicUrl:
              _promotionModel != null ? _promotionModel.brandModel.imgUrl : '',
        ),
        ShowDetail(
          detail: _promotionModel != null ? _promotionModel.description : '',
        ),
        // BrandContact(
        //   email: 'unidelivery@gmail.com',
        //   numOfStore: 7,
        //   phone: '19001000',
        // ),
        _promotionModel != null
            ? SomeBrandInfo(
                brandTitle: _promotionModel.brandModel.brandName,
                info: _promotionModel.brandModel.description,
                brandId: _promotionModel.brandModel.id,
                imgUrl: _promotionModel.brandModel.imgUrl,
              )
            : SizedBox(),
        SizedBox(
          height: 100,
        ),
      ]),
    );
  }

  Widget _buildTitle({
    String title: '',
    String brand: '',
    int point: 0,
    String brandPicUrl: '',
  }) {
    return Neumorphic(
      style: neumorphicStyleUpDefault,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Neumorphic(
              style: neumorphicStyleUpCircle,
              child: brandPicUrl.isNotEmpty
                  ? CustomNetworkImage(
                      imgUrl: brandPicUrl,
                      width: 80,
                      height: 80,
                    )
                  : Container(
                      color: CustomColors.BACKGROUND_COLOR,
                      width: 80,
                      height: 80,
                    ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title,
                    style: BOLD_TITLE_TEXT_STYLE,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    brand,
                    style: DEFAULT_TEXT_STYLE,
                  ),
                ),
                Point(
                  point: point,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Neumorphic(
        style: neumorphicStyleDownDefault,
        child: _promotionModel != null
            ? CustomNetworkImage(
                imgUrl: _promotionModel.imgUrl,
                width: double.maxFinite,
                height: 350,
              )
            : Container(
                color: CustomColors.BACKGROUND_COLOR,
              ),
      ),
      expandedHeight: 250,
      pinned: true,
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () async {
          await Helper.navigationDelay();
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.close,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
      // actions: [
      //   NeumorphicButton(
      //     style: neumorphicStyleUpCircle,
      //     onPressed: () async {
      //       await Helper.navigationDelay();
      //       Navigator.pop(context);
      //     },
      //     padding: EdgeInsets.all(16),
      //     margin: EdgeInsets.symmetric(horizontal: 32),
      //     child: Icon(
      //       Icons.close,
      //       color: CustomColors.TEXT_COLOR,
      //       size: BIG_FONT_SIZE,
      //     ),
      //   ),
      // ],
    );
  }
}
