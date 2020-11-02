// Author: Trung Shin

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constant.dart';

class AdsWidget extends StatefulWidget {
  @override
  _AdsWidgetState createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Neumorphic(
          style: neumorphicStyleDownDefault,
          margin: EdgeInsets.all(16),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.maxFinite,
                    child: Image.network(
                      'https://www.tiendauroi.com/wp-content/uploads/2020/04/93515371_2962625523804435_5994003590329401344_o-750x750.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        _buildAdsCount(),
      ],
    );
  }

  Widget _buildAdsCount() {
    List<Widget> children = [];
    for (int i = 0; i < 5; i++) {
      children.add(
        Container(
          height: 16,
          width: 16,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
              depth: _currentIndex == i ? 20 : -20,
            ),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
