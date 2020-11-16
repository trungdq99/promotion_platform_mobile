// Author: Trung Shin

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';

import '../constant.dart';

class AdsWidget extends StatefulWidget {
  @override
  _AdsWidgetState createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  int _currentIndex = 0;
  CarouselController _carouselController;
  @override
  void initState() {
    _carouselController = CarouselController();
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
            carouselController: _carouselController,
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
                  return CustomNetworkImage(
                    imgUrl:
                        'https://www.tiendauroi.com/wp-content/uploads/2020/04/93515371_2962625523804435_5994003590329401344_o-750x750.jpg',
                    width: double.maxFinite,
                    height: 150,
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
        NeumorphicButton(
          onPressed: () {
            _carouselController.animateToPage(
              i,
              duration: Duration(milliseconds: 100),
            );
            setState(() {
              _currentIndex = i;
            });
          },
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(horizontal: 16),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            depth: _currentIndex == i ? 20 : -20,
          ),
          child: SizedBox(
            width: 16,
            height: 16,
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
