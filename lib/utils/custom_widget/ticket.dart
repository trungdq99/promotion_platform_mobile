import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/ui/voucher_detail_screen.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

class Ticket extends StatelessWidget {
  final double margin = 20;
  final double borderRadius = 16;
  final double clipRadius = 12.5;
  final double smallClipRadius = 2;
  final int numberOfSmallClips = 30;

  final String voucherTitle;
  final String brandTitle;
  final String date;
  const Ticket({
    this.voucherTitle,
    this.brandTitle,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MyGiftDetailScreen(),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 37,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipPath(
          clipper: TicketClipper(
            borderRadius: borderRadius,
            clipRadius: clipRadius,
            smallClipRadius: smallClipRadius,
            numberOfSmallClips: numberOfSmallClips,
          ),
          child: Neumorphic(
            style: NeumorphicStyle(
              // border: NeumorphicBorder(
              //   width: 1,
              //   color: Colors.teal,
              // ),
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Neumorphic(
                    child: Text(
                      'Uni',
                      style: DEFAULT_TEXT_STYLE,
                    ),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(24),
                    style: NeumorphicStyle(
                      depth: -20,
                      color: CustomColors.GREEN,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quà tặng - Voucher 500,000 VNĐ',
                          style: BOLD_TITLE_TEXT_STYLE,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Uni Delivery',
                        ),
                        Align(
                          child: Text('HSD: 23/09/2020'),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sử dụng ngay'),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Text('Còn 1 ngày'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  static const double clipPadding = 18;

  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;

  const TicketClipper({
    this.borderRadius,
    this.clipRadius,
    this.smallClipRadius,
    this.numberOfSmallClips,
  });

  @override
  Path getClip(Size size) {
    var path = Path();
    final clipCenterX = size.width * 0.25;
    // draw rect
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));

    final clipPath = Path();

    clipPath.addOval(Rect.fromCircle(
      center: Offset(clipCenterX, 0),
      radius: clipRadius,
    ));
    clipPath.addOval(Rect.fromCircle(
      center: Offset(clipCenterX, size.height),
      radius: clipRadius,
    ));
    // draw small clip circles
    final clipContainerSize = size.width - clipRadius * 2 - clipPadding * 2;
    final smallClipSize = smallClipRadius * 2;
    final smallClipBoxSize = clipContainerSize / numberOfSmallClips;
    final smallClipPadding = (smallClipBoxSize - smallClipSize) / 2;
    final smallClipStart = clipRadius;

    final smallClipCenterOffsets = List.generate(numberOfSmallClips, (index) {
      final boxX = smallClipStart + smallClipBoxSize * index;
      final centerX = boxX + smallClipPadding + smallClipRadius;

      return Offset(clipCenterX, centerX);
    });

    smallClipCenterOffsets.forEach((centerOffset) {
      clipPath.addOval(Rect.fromCircle(
        center: centerOffset,
        radius: smallClipRadius,
      ));
    });

    // combine two path together
    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );

    return ticketPath;
  }

  @override
  bool shouldReclip(TicketClipper old) =>
      old.borderRadius != borderRadius ||
      old.clipRadius != clipRadius ||
      old.smallClipRadius != smallClipRadius ||
      old.numberOfSmallClips != numberOfSmallClips;
}
