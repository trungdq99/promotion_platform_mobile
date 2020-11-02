import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_widget/ticket.dart';

class MyGiftScreen extends StatefulWidget {
  @override
  _MyGiftScreenState createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'Quà đã đổi',
                  style: HEADER_TEXT_STYLE,
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
                //floating: true,
                pinned: true,

                // leading: CustomBackButton(
                //   function: () {
                //     // Navigator.of(context,nullOk: true,).pop();
                //     Navigator.pop(context);
                //   },
                // ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Ticket(
                        brandTitle: '',
                        date: '',
                        voucherTitle: '',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
