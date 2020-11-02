import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';

import '../constant.dart';

class SomeBrandInfo extends StatelessWidget {
  final String brandTitle;
  final String info;
  final Function function;
  SomeBrandInfo({
    @required this.brandTitle,
    @required this.info,
    this.function,
  });
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: neumorphicStyleUpWithSmallRadius,
      onPressed: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => BrandDetailScreen(),
            ));
      },
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Image.network(
                'https://brasol.vn/public/uploads/1528692055-29.png',
                fit: BoxFit.cover,
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
                    this.brandTitle,
                    style: BOLD_TITLE_TEXT_STYLE,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    this.info,
                    overflow: TextOverflow.ellipsis,
                    style: SMALL_TEXT_STYLE,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  NeumorphicButton(
                    style: neumorphicStyleDownWithHighRadius,
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
