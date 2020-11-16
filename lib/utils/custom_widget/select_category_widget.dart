// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/helper.dart';

import '../constant.dart';
import '../custom_colors.dart';

class SelectCategoryWidget extends StatefulWidget {
  final int selectedIndex;
  SelectCategoryWidget({@required this.selectedIndex});
  @override
  _SelectCategoryWidgetState createState() => _SelectCategoryWidgetState();
}

class _SelectCategoryWidgetState extends State<SelectCategoryWidget> {
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
                'Nhóm',
                style: BOLD_TITLE_TEXT_STYLE,
              ),
            ),
            Neumorphic(
              style: neumorphicStyleDownDefault,
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  _buildSelectItem(
                    title: 'Tất cả',
                    index: 0,
                  ),
                  _buildSelectItem(
                    title: 'Đồ ăn',
                    index: 1,
                  ),
                  _buildSelectItem(
                    title: 'Thời trang',
                    index: 2,
                  ),
                  _buildSelectItem(
                    title: 'Đồ uống',
                    index: 3,
                  ),
                  _buildSelectItem(
                    title: 'Dịch vụ',
                    index: 4,
                  ),
                  _buildSelectItem(
                    title: 'Giải trí',
                    index: 5,
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
