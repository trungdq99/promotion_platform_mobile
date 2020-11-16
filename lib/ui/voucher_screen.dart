import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_bloc.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_state.dart';
import 'package:promotion_platform/models/voucher_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/ticket.dart';
import 'package:promotion_platform/utils/helper.dart';

class MyGiftScreen extends StatefulWidget {
  @override
  _MyGiftScreenState createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {
  VouchersBloc _vouchersBloc;

  @override
  Widget build(BuildContext context) {
    _vouchersBloc = BlocProvider.of<VouchersBloc>(context);
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildListVoucher(),
        )
      ],
    );
  }

  Widget _buildListVoucher() {
    return BlocEventStateBuilder<VouchersState>(
      builder: (context, state) {
        List<VoucherModel> list;
        if (state.isLoaded) {
          list = state.listVoucherModel;
        }
        List<Widget> children = [];
        if (list != null) {
          list.forEach((element) {
            children.add(Ticket(
              voucherModel: element,
            ));
          });
        }
        return SingleChildScrollView(
          child: Column(
            children: children,
          ),
        );
      },
      bloc: _vouchersBloc,
    );
  }

  Widget _buildAppBar() {
    return NeumorphicAppBar(
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () async {
          await Helper.navigationDelay();
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(0),
        child: Icon(
          Icons.arrow_back_ios,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
      title: Text(
        'Quà đã đổi',
        style: HEADER_TEXT_STYLE,
      ),
      centerTitle: true,
    );
  }
}
