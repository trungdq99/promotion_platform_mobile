import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_bloc.dart';
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/brand_contact.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/custom_widget/show_detail.dart';
import 'package:promotion_platform/utils/custom_widget/promotion_widget.dart';

class BrandDetailScreen extends StatefulWidget {
  @override
  _BrandDetailScreenState createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  ScrollController _scrollController;
  BrandDetailScreenBloc _brandDetailScreenBloc;
  double deviceWidth;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _brandDetailScreenBloc = BlocProvider.of<BrandDetailScreenBloc>(context);
    deviceWidth = MediaQuery.of(context).size.width;
    return BlocEventStateBuilder<BrandDetailScreenState>(
      builder: (context, state) {
        BrandModel brandModel = BrandModel();
        if (state.isOpen) {
          brandModel = state.brandModel;
        }

        return _buildScreen(
          context,
          state.isOpening,
          brandModel,
        );
      },
      bloc: _brandDetailScreenBloc,
    );
  }

  Widget _buildScreen(
    BuildContext context,
    bool isProgressing,
    BrandModel brandModel,
  ) {
    return Stack(
      children: [
        Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildAppBar(context),
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildTitle(
                      brandTitle: brandModel.brandName,
                      phone: brandModel.phoneNumber,
                      numOfStore: 7,
                      type: 'Ẩm thực, ăn uống các thứ'),
                  ShowDetail(detail: brandModel.description),
                  // ShowDetail(
                  //   detail: 'Hệ thống giao hàng cho sinh viên FPT\n'
                  //       '- Giao hàng tận nơi với mức giá phải chăng.\n'
                  //       '- Thức ăn luôn nóng hổi sẵn sàng ăn ngay, hoặc bạn có thể hâm lại bằng lò vi sóng ở 7/11\n'
                  //       'Hệ thống giao hàng cho sinh viên FPT\n'
                  //       '- Giao hàng tận nơi với mức giá phải chăng.\n'
                  //       '- Thức ăn luôn nóng hổi sẵn sàng ăn ngay, hoặc bạn có thể hâm lại bằng lò vi sóng ở 7/11\n'
                  //       'Hệ thống giao hàng cho sinh viên FPT\n'
                  //       '- Giao hàng tận nơi với mức giá phải chăng.\n'
                  //       '- Thức ăn luôn nóng hổi sẵn sàng ăn ngay, hoặc bạn có thể hâm lại bằng lò vi sóng ở 7/11\n',
                  // ),
                  SafeArea(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
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
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        isProgressing ? FullScreenProgressing() : Container(),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        color: Colors.teal,
      ),
      expandedHeight: 150,
      pinned: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black12,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle({
    String brandTitle,
    String email,
    String phone,
    int numOfStore,
    String type,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              brandTitle,
              style: BOLD_TITLE_TEXT_STYLE,
            ),
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.teal,
            ),
            trailing: Icon(Icons.star),
            subtitle: Row(
              children: [
                Icon(Icons.star),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '5.0',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ],
            ),
          ),
          BrandContact(
            phone: phone,
            numOfStore: numOfStore,
            email: email,
            type: type,
          ),
        ],
      ),
    );
  }
}
