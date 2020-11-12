// Author: Trung Shin

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';

class CustomNetworkImage extends StatefulWidget {
  final double height;
  final double width;
  final String imgUrl;

  CustomNetworkImage({
    @required this.imgUrl,
    @required this.width,
    @required this.height,
  });
  @override
  _CustomNetworkImageState createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imgUrl,
      placeholder: (context, url) => Center(
        child: Progressing(),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
      height: widget.height,
      width: widget.width,
    );
  }
}
