// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/helper.dart';

import '../constant.dart';
import '../custom_colors.dart';

class SelectFilterWidget extends StatefulWidget {
  final int selectedIndex;
  SelectFilterWidget({@required this.selectedIndex});
  @override
  _SelectFilterWidgetState createState() => _SelectFilterWidgetState();
}

class _SelectFilterWidgetState extends State<SelectFilterWidget> {
  int groupValue = 0;
  @override
  void initState() {
    groupValue = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Sắp xếp',
                style: BOLD_TITLE_TEXT_STYLE,
              ),
            ),
            Neumorphic(
              style: neumorphicStyleDownDefault,
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  _buildSelectItem(
                    title: 'Mới nhất',
                    index: 0,
                  ),
                  _buildSelectItem(
                    title: 'Cũ nhất',
                    index: 1,
                  ),
                ],
              ),
            ),
            groupValue != null && groupValue >= 0
                ? NeumorphicButton(
                    style: neumorphicStyleUpWithHighRadius,
                    onPressed: () async {
                      await Helper.navigationDelay();
                      Navigator.pop(context, [
                        groupValue,
                        true,
                      ]);
                    },
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Chọn',
                      style: DEFAULT_TEXT_STYLE,
                    ),
                  )
                : Neumorphic(
                    style: neumorphicStyleDownWithHighRadius,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Chọn',
                      style: DEFAULT_TEXT_STYLE,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectItem({
    @required String title,
    @required int index,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: DEFAULT_TEXT_STYLE,
          ),
          NeumorphicRadio(
            // style: neuU,
            style: NeumorphicRadioStyle(
              boxShape: NeumorphicBoxShape.circle(),
              selectedDepth: 20,
              unselectedDepth: -20,
              selectedColor: CustomColors.GREEN,
            ),
            value: index,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },

            child: SizedBox(
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
