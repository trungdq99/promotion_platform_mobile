import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';

class PromotionWidget extends StatefulWidget {
  const PromotionWidget({
    @required this.promotionName,
    @required this.brandName,
    @required this.price,
    @required this.id,
    @required this.imgUrl,
    this.function,
  });

  final String brandName;
  final String promotionName;
  final int price;
  final int id;
  final String imgUrl;
  final Function function;
  @override
  _PromotionWidgetState createState() => _PromotionWidgetState();
}

class _PromotionWidgetState extends State<PromotionWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return NeumorphicButton(
      onPressed: widget.function,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(0),
      style: neumorphicStyleUpWithSmallRadius,
      child: Container(
        width: width / 2 - 32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imgUrl: widget.imgUrl,
              width: width / 2 - 32,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                this.widget.promotionName,
                style: BOLD_SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                this.widget.brandName,
                style: SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Point(
              point: widget.price,
            ),
          ],
        ),
      ),
    );
  }
}
