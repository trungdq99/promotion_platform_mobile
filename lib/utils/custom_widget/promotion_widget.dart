import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({
    Key key,
    @required this.voucherTitle,
    @required this.brandTitle,
    @required this.price,
    this.function,
  }) : super(key: key);

  final String brandTitle;
  final String voucherTitle;
  final int price;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: function,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(0),
      style: neumorphicStyleUpWithSmallRadius,
      child: Container(
        width: 208,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 208,
              child: Image.network(
                'https://www.tiendauroi.com/wp-content/uploads/2020/04/93515371_2962625523804435_5994003590329401344_o-750x750.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                this.voucherTitle,
                style: BOLD_SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                this.brandTitle,
                style: SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Point(
              point: 1000,
            ),
          ],
        ),
      ),
    );
  }
}
