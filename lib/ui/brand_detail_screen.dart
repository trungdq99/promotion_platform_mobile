import 'package:flutter/material.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_bloc.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_event.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/brand_contact.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/custom_widget/show_detail.dart';
import 'package:promotion_platform/utils/custom_widget/promotion_widget.dart';

class BrandDetailScreen extends StatefulWidget {
  final int brandId;
  BrandDetailScreen({@required this.brandId});
  @override
  _BrandDetailScreenState createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  ScrollController _scrollController = ScrollController();
  double deviceWidth;
  BrandDetailBloc _brandDetailBloc;
  @override
  void initState() {
    _brandDetailBloc = BrandDetailBloc();
    _brandDetailBloc.emitEvent(BrandDetailEventLoad(brandId: widget.brandId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return BlocEventStateBuilder<BrandDetailState>(
      builder: (context, state) {
        BrandModel brandModel;
        if (state.isLoad) {
          brandModel = state.brandModel;
        }
        return _buildScreen(
          brandModel: brandModel,
          isProgressing: state.isLoading,
        );
      },
      bloc: _brandDetailBloc,
    );
  }

  Widget _buildScreen({
    bool isProgressing,
    @required BrandModel brandModel,
  }) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildAppBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  brandModel != null
                      ? _buildTitle(
                          brandTitle: brandModel.brandName ?? '',
                          phone: brandModel.phoneNumber ?? '',
                          numOfStore: 7,
                          type: 'Ẩm thực, ăn uống các thứ')
                      : Container(
                          child: Text('Empty brand!'),
                        ),
                  brandModel != null
                      ? ShowDetail(detail: brandModel.description ?? '')
                      : SizedBox(),
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
                            promotionName: 'Voucher 500,000 VND',
                            brandName: 'Uni Delivery',
                            price: 1000,
                          ),
                          PromotionWidget(
                            promotionName: 'Voucher 500,000 VND',
                            brandName: 'Uni Delivery',
                            price: 1000,
                          ),
                          PromotionWidget(
                            promotionName: 'Voucher 500,000 VND',
                            brandName: 'Uni Delivery',
                            price: 1000,
                          ),
                          PromotionWidget(
                            promotionName: 'Voucher 500,000 VND',
                            brandName: 'Uni Delivery',
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
          isProgressing ? FullScreenProgressing() : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
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
            Navigator.pop(context);
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
    String brandTitle: '',
    String email: '',
    String phone: '',
    int numOfStore: 0,
    String type: '',
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
