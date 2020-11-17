// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';

import '../constant.dart';

class BrandWidget extends StatefulWidget {
  String brandTitle;
  int promotions;
  String imageUrl;
  int brandId;
  Function function;
  BrandWidget({
    this.brandTitle: '',
    @required this.brandId,
    this.imageUrl: '',
    this.promotions: 0,
    this.function,
  });
  @override
  _BrandWidgetState createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: widget.function,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(0),
      child: Container(
        width: 124,
        height: 124,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomNetworkImage(
              imgUrl: widget.imageUrl,
              width: 124,
              height: 64,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.brandTitle,
                style: BOLD_SMALL_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
                textWidthBasis: TextWidthBasis.parent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${widget.promotions} khuyến mãi',
                style: SMALL_TEXT_STYLE,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
