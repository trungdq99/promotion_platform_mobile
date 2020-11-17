import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/bloc/notification/notification_bloc.dart';
import 'package:promotion_platform/bloc/promotions/promotions_bloc.dart';
import 'package:promotion_platform/bloc/promotions/promotions_event.dart';
import 'package:promotion_platform/bloc/promotions/promotions_state.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_bloc.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_state.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/models/voucher_model.dart';
import 'package:promotion_platform/ui/promotion_detail_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/custom_widget/icon/search_icon.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/icon/voucher_icon.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';
import 'package:promotion_platform/utils/custom_widget/select_category_widget.dart';
import 'package:promotion_platform/utils/custom_widget/select_filter_widget.dart';
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
  TextEditingController _searchController;
  PromotionsBloc _promotionsBloc;
  CustomerBloc _customerBloc;
  VouchersBloc _vouchersBloc;
  int _categoryId;
  int _filterId;
  @override
  void initState() {
    _searchController = TextEditingController();
    _categoryId = 0;
    _filterId = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _promotionsBloc = BlocProvider.of<PromotionsBloc>(context);
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _vouchersBloc = BlocProvider.of<VouchersBloc>(context);
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
                  children: [
                    _buildAppBar(),
                    _buildSearchTextField(),
                    _buildListPromotion(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: NeumorphicButton(
                      style: neumorphicStyleUpWithSmallRadius,
                      margin: EdgeInsets.all(16),
                      onPressed: () async {
                        await Helper.navigationDelay();

                        List result = await showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              SelectCategoryWidget(selectedIndex: _categoryId),
                          backgroundColor: CustomColors.BACKGROUND_COLOR,
                        );
                        if (result != null) {
                          bool isChange = result[1];
                          if (isChange) {
                            setState(() {
                              _categoryId = result[0];
                            });
                            _promotionsBloc.emitEvent(PromotionsEventLoad(
                              categoryId: _categoryId,
                              filterId: _filterId,
                              pageId: 0,
                              search: _searchController.text,
                            ));
                          }
                        }
                      },
                      child: Text(
                        CATEGORIES[_categoryId],
                        style: DEFAULT_TEXT_STYLE,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: NeumorphicButton(
                      style: neumorphicStyleUpWithSmallRadius,
                      margin: EdgeInsets.all(16),
                      onPressed: () async {
                        await Helper.navigationDelay();

                        List result = await showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              SelectFilterWidget(selectedIndex: _filterId),
                          backgroundColor: CustomColors.BACKGROUND_COLOR,
                        );
                        if (result != null) {
                          bool isChange = result[1];
                          if (isChange) {
                            setState(() {
                              _filterId = result[0];
                            });
                            _promotionsBloc.emitEvent(PromotionsEventLoad(
                              categoryId: _categoryId,
                              filterId: _filterId,
                              pageId: 0,
                              search: _searchController.text,
                            ));
                          }
                        }
                      },
                      child: Text(
                        FILTER[_filterId],
                        style: DEFAULT_TEXT_STYLE,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: 0,
          ),
        ],
      ),
    );
  }

  Widget _buildListPromotion() {
    return BlocEventStateBuilder<PromotionsState>(
      builder: (context, state) {
        List<PromotionModel> listPromotions;
        List<Widget> children = [];
        if (state.isLoaded) {
          listPromotions = state.listPromotionModel;
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
        return listPromotions != null && listPromotions.length > 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: listPromotions.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return PromotionWidget(
                    id: listPromotions[index].id,
                    imgUrl: listPromotions[index].imgUrl,
                    price: listPromotions[index].price,
                    brandName: listPromotions[index].brandModel.brandName,
                    promotionName: listPromotions[index].promotionName,
                    function: () async {
                      await Helper.navigationDelay();
                      Navigator.push(
                        widget.homeContext,
                        CupertinoPageRoute(
                          builder: (context) => PromotionDetailScreen(
                              id: listPromotions[index].id),
                        ),
                      );
                    },
                  );
                },
              )
            : Container(
                child: Text(
                  'Empty list promotion',
                  style: DEFAULT_TEXT_STYLE,
                ),
              );
        // return SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: listPromotions != null
        //       ? Row(
        //           children: children,
        //         )
        //       : Container(
        //           child: Text(
        //             'Empty list promotion',
        //             style: DEFAULT_TEXT_STYLE,
        //           ),
        //         ),
        // );
      },
      bloc: _promotionsBloc,
    );
  }

  Widget _buildSearchTextField() {
    return Neumorphic(
      style: neumorphicStyleDownDefault,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tìm kiếm quà',
          suffixIcon: NeumorphicButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              _promotionsBloc.emitEvent(PromotionsEventLoad(
                categoryId: _categoryId,
                filterId: _filterId,
                pageId: 0,
                search: _searchController.text,
              ));
            },
            style: neumorphicStyleUpCircle,
            padding: EdgeInsets.all(0),
            child: SearchIcon(),
          ),
        ),
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
          _promotionsBloc.emitEvent(PromotionsEventLoad(
            categoryId: _categoryId,
            filterId: _filterId,
            pageId: 0,
            search: _searchController.text,
          ));
        },
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
}
