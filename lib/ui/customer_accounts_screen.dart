// Author: Trung Shin
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/customer_accounts/customer_accounts_bloc.dart';
import 'package:promotion_platform/bloc/customer_accounts/customer_accounts_event.dart';
import 'package:promotion_platform/bloc/customer_accounts/customer_accounts_state.dart';
import 'package:promotion_platform/models/customer_account_model.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';
import 'package:promotion_platform/utils/helper.dart';

class CustomerAccountsScreen extends StatefulWidget {
  final int membershipCardId;
  final String token;
  CustomerAccountsScreen({
    @required this.membershipCardId,
    @required this.token,
  });
  @override
  _CustomerAccountsScreenState createState() => _CustomerAccountsScreenState();
}

class _CustomerAccountsScreenState extends State<CustomerAccountsScreen> {
  CustomerAccountsBloc _customerAccountsBloc;

  @override
  void initState() {
    _customerAccountsBloc = CustomerAccountsBloc();
    _customerAccountsBloc.emitEvent(CustomerAccountsEventLoad(
      membershipId: widget.membershipCardId,
      token: widget.token,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListCustomerAccount(),
    );
  }

  Widget _buildListCustomerAccount() {
    return BlocEventStateBuilder<CustomerAccountsState>(
      builder: (context, state) {
        List<CustomerAccountModel> listCustomerAccount;
        if (state.isLoad) {
          listCustomerAccount = state.listCustomerAccount;
        }
        List<Widget> _children = [];
        if (listCustomerAccount != null && listCustomerAccount.length > 0) {
          listCustomerAccount.forEach((element) {
            _children.add(_buildCustomerAccount(
              name: element.accountName,
              point: element.balance.toInt(),
            ));
          });
        }
        if (state.isLoading) {
          return Center(child: Progressing());
        }
        return _children.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: _children,
                ),
              )
            : Center(
                child: Text(
                  'Bạn hiện đang không có tài khoản nào!',
                  style: DEFAULT_TEXT_STYLE,
                ),
              );
      },
      bloc: _customerAccountsBloc,
    );
  }

  Widget _buildAppBar() {
    return NeumorphicAppBar(
      title: Text(
        'Danh sách tài khoản',
        style: HEADER_TEXT_STYLE,
      ),
      centerTitle: true,
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
    );
  }

  Widget _buildCustomerAccount({
    @required String name,
    @required int point,
  }) {
    return Neumorphic(
      style: neumorphicStyleDownWithSmallRadius,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(24),
      child: Table(
        children: [
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Tên tài khoản:',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  name,
                  style: BOLD_TITLE_TEXT_STYLE,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Point(
                  point: point,
                  hasBorder: false,
                ),
              ),
              SizedBox(),
              // NeumorphicButton(
              //   style: neumorphicStyleUpWithSmallRadius,
              //   onPressed: () {},
              //   child: Text(
              //     'Lịch sử',
              //     style: DEFAULT_TEXT_STYLE,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
