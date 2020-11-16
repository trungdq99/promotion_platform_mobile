import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';

import '../constant.dart';

class SomeBrandInfo extends StatefulWidget {
  final String brandTitle;
  final String info;
  final int brandId;
  final String imgUrl;

  SomeBrandInfo({
    this.brandTitle: '',
    this.info: '',
    this.imgUrl: '',
    this.brandId,
  });

  @override
  _SomeBrandInfoState createState() => _SomeBrandInfoState();
}

class _SomeBrandInfoState extends State<SomeBrandInfo> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: neumorphicStyleUpWithSmallRadius,
      onPressed: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => BrandDetailScreen(
                brandId: widget.brandId,
              ),
            ));
      },
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Neumorphic(
              style: neumorphicStyleUpCircle,
              child: widget.imgUrl.isNotEmpty
                  ? CustomNetworkImage(
                      imgUrl: widget.imgUrl,
                      width: 68,
                      height: 68,
                    )
                  : Container(
                      width: 68,
                      height: 68,
                      color: CustomColors.BACKGROUND_COLOR,
                    ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.widget.brandTitle,
                    style: BOLD_TITLE_TEXT_STYLE,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    this.widget.info,
                    overflow: TextOverflow.ellipsis,
                    style: SMALL_TEXT_STYLE,
                  ),
                  Neumorphic(
                    style: neumorphicStyleUpWithHighRadius,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Chi tiết',
                      style: SMALL_TEXT_STYLE,
                    ),
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
