import 'package:flutter/material.dart';
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BrandDetailScreen(),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.teal,
                height: 50,
              ),
            ),
            Expanded(
              flex: 3,
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
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
          ],
        ),
      ),
    );
  }
}
