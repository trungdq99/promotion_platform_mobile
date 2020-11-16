import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/voucher_preparation/voucher_preparation_bloc.dart';
import 'package:promotion_platform/bloc/voucher_preparation/voucher_preparation_event.dart';
import 'package:promotion_platform/bloc/voucher_preparation/voucher_preparation_state.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_bloc.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_event.dart';
import 'package:promotion_platform/models/voucher_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/brand_contact.dart';
import 'package:promotion_platform/utils/custom_widget/custom_alert.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';
import 'package:promotion_platform/utils/custom_widget/show_detail.dart';
import 'package:promotion_platform/utils/custom_widget/some_brand_info.dart';
import 'package:promotion_platform/utils/helper.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VoucherDetailScreen extends StatefulWidget {
  final VoucherModel voucherModel;

  VoucherDetailScreen({this.voucherModel});
  @override
  _VoucherDetailScreenState createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends State<VoucherDetailScreen> {
  ScrollController _scrollController = ScrollController();
  double deviceWidth;

  VoucherPreparationBloc _voucherPreparationBloc;
  @override
  void initState() {
    super.initState();
    _voucherPreparationBloc = VoucherPreparationBloc();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final _vouchersBloc = BlocProvider.of<VouchersBloc>(context);
    String token;
    if (_authenticationBloc.lastState.isAuthenticated) {
      token = _authenticationBloc.lastState.token;
    }
    return Scaffold(
      body: BlocEventStateBuilder<VoucherPreparationState>(
        bloc: _voucherPreparationBloc,
        builder: (context, state) {
          if (token != null && token.isNotEmpty && state.isUpdated) {
            _vouchersBloc.emitEvent(VouchersEventLoad(token: token));
          }
          return Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  _buildAppBar(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _buildTitle(),
                      ShowDetail(
                        detail: widget.voucherModel.description,
                      ),
                      // BrandContact(
                      //   email: 'unidelivery@gmail.com',
                      //   numOfStore: 7,
                      //   phone: '19001000',
                      // ),
                      // SomeBrandInfo(
                      //   brandTitle: widget.voucherModel.brandName,
                      //   info: 'Hệ thống giao hàng cho sinh viên',
                      //   imgUrl: '',
                      //   brandId: widget.voucherModel.brandId,
                      // ),
                      widget.voucherModel.isUsed
                          ? Neumorphic(
                              style: neumorphicStyleUpWithSmallRadius,
                              padding: EdgeInsets.all(32),
                              child: QrImage(
                                data: widget.voucherModel.voucherCode,
                                version: QrVersions.auto,
                                size: 250,
                                gapless: false,
                              ),
                            )
                          : SizedBox(),

                      SizedBox(
                        height: 100,
                      ),
                    ]),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: NeumorphicButton(
                  style: neumorphicStyleUpWithHighRadius,
                  onPressed: () async {
                    await Helper.navigationDelay();
                    if (token != null &&
                        token.isNotEmpty &&
                        widget.voucherModel.id != null) {
                      if (widget.voucherModel.isUsed) {
                        _voucherPreparationBloc
                            .emitEvent(VoucherPreparationEventCancel(
                          id: widget.voucherModel.id,
                          token: token,
                        ));
                      } else {
                        _voucherPreparationBloc
                            .emitEvent(VoucherPreparationEventUse(
                          id: widget.voucherModel.id,
                          token: token,
                        ));
                      }
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
                      widget.voucherModel.isUsed ? 'Huỷ' : 'Sử dụng',
                      style: DEFAULT_TEXT_STYLE,
                    ),
                  ),
                ),
              ),
              state.isUpdating ? FullScreenProgressing() : SizedBox(),
              state.isUpdated ? CustomAlert(errMsg: state.message) : SizedBox(),
              state.isError ? CustomAlert(errMsg: state.message) : SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Neumorphic(
      style: neumorphicStyleUpDefault,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.voucherModel.promotionName,
            style: BOLD_TITLE_TEXT_STYLE,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.voucherModel.brandName,
            style: DEFAULT_TEXT_STYLE,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HSD: ${Helper.convertDateToString(Helper.convertStringToDateTimeVer2(widget.voucherModel.expiredDate))}',
                style: DEFAULT_TEXT_STYLE,
              ),
              Neumorphic(
                style: neumorphicStyleUpWithSmallRadius,
                child: Container(
                  color: CustomColors.GREEN,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text('Còn ${widget.voucherModel.remainingDay} ngày'),
                ),
              ),
            ],
          ),
          // Point(
          //   point: point,
          // ),
        ],
      ),
    );
  }

  // App bar
  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Neumorphic(
        style: neumorphicStyleDownDefault,
        child: widget.voucherModel != null
            ? CustomNetworkImage(
                imgUrl: widget.voucherModel.imgUrl,
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
