import 'package:flutter/material.dart';
import 'package:promotion_platform/ui/gift_detail_screen.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';

class Voucher extends StatelessWidget {
  const Voucher({
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
    return InkWell(
      onTap: function,
      child: Container(
        width: 250,
        margin: EdgeInsets.only(
          left: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              // child: Image.asset(
              //   'assets/images/Untitled-1.png',
              //   fit: BoxFit.fill,
              // ),
              child: Container(
                height: 100,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.voucherTitle,
                style: BOLD_TITLE_TEXT_STYLE,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                this.brandTitle,
                style: DEFAULT_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 8,
              ),
              child: Point(
                point: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
