import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_bloc.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_event.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/brand_contact.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/custom_widget/show_detail.dart';
import 'package:promotion_platform/utils/custom_widget/promotion_widget.dart';
import 'package:promotion_platform/utils/helper.dart';

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
              _buildAppBar(
                  brandModel: brandModel, isProgressing: isProgressing),
              SliverList(
                delegate: SliverChildListDelegate([
                  brandModel != null
                      ? _buildTitle(
                          brandTitle: brandModel.brandName ?? '',
                          brandPicUrl: brandModel.imgUrl ?? '',
                        )
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
                ]),
              ),
            ],
          ),
          isProgressing ? FullScreenProgressing() : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildAppBar({
    bool isProgressing,
    @required BrandModel brandModel,
  }) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Neumorphic(
        style: neumorphicStyleDownDefault,
        child: brandModel != null
            ? CustomNetworkImage(
                imgUrl: brandModel.imgUrl,
                width: double.maxFinite,
                height: 350,
              )
            : Container(
                color: CustomColors.BACKGROUND_COLOR,
              ),
      ),
      // flexibleSpace: Container(
      //   color: Colors.teal,
      // ),
      expandedHeight: 250,
      pinned: true,
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () async {
          await Helper.navigationDelay();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
      // leading: Padding(
      //   padding: EdgeInsets.only(left: 16),
      //   child: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundColor: Colors.black12,
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: 16),
      //     child: InkWell(
      //       onTap: () {},
      //       child: CircleAvatar(
      //         radius: 20,
      //         backgroundColor: Colors.black12,
      //         child: Icon(
      //           Icons.share,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  Widget _buildTitle({
    String brandTitle: '',
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
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandTitle,
                    style: BOLD_TITLE_TEXT_STYLE,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: CustomColors.YELLOW,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '5.0',
                        style: DEFAULT_TEXT_STYLE,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
