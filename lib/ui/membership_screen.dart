// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/memberships/memberships_bloc.dart';
import 'package:promotion_platform/bloc/memberships/memberships_event.dart';
import 'package:promotion_platform/bloc/memberships/memberships_state.dart';
import 'package:promotion_platform/models/membership_model.dart';
import 'package:promotion_platform/ui/customer_accounts_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/progressing.dart';
import 'package:promotion_platform/utils/helper.dart';

class MembershipScreen extends StatefulWidget {
  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  MembershipsBloc _membershipsBloc = MembershipsBloc();
  String token;
  @override
  Widget build(BuildContext context) {
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocEventStateBuilder<AuthenticationState>(
      builder: (context, authenticationState) {
        if (authenticationState.isAuthenticated) {
          token = authenticationState.token;
        }
        if (token != null && token.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _membershipsBloc.emitEvent(MembershipsEventLoad(token: token));
          });
        }
        return _buildScreen();
      },
      bloc: _authenticationBloc,
    );
  }

  Widget _buildScreen() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListMemberships(),
    );
  }

  Widget _buildListMemberships() {
    return BlocEventStateBuilder<MembershipsState>(
      builder: (context, state) {
        List<MembershipModel> listMemberships;
        if (state.isLoad) {
          listMemberships = state.listMembership;
        }
        List<Widget> _children = [];
        if (listMemberships != null && listMemberships.length > 0) {
          listMemberships.forEach((element) {
            _children.add(_buildMembershipInfo(
              id: element.id ?? 0,
              type: element.membershipTypeName,
              brandName: element.brandName ?? 'Uni',
              createdTime:
                  Helper.formatDateTime(element.createdTime) ?? '11/11/1111',
            ));
          });
        }
        if (state.isLoading) {
          return Center(child: Progressing());
        }
        return SingleChildScrollView(
          child: _children.length > 0
              ? Column(
                  children: _children,
                )
              : Center(
                  child: Text(
                    'Bạn hiện đang không có thẻ thành viên nào!',
                    style: DEFAULT_TEXT_STYLE,
                  ),
                ),
        );
      },
      bloc: _membershipsBloc,
    );
  }

  Widget _buildMembershipInfo({
    @required int id,
    @required String type,
    @required String brandName,
    @required String createdTime,
  }) {
    return NeumorphicButton(
      style: neumorphicStyleUpWithSmallRadius,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(24),
      onPressed: () async {
        await Helper.navigationDelay();
        if (token != null && token.isNotEmpty) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => CustomerAccountsScreen(
                  membershipCardId: id,
                  token: token,
                ),
              ));
        }
      },
      child: Table(
        children: [
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Loại thẻ:',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  type,
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
                child: Text(
                  'Thương hiệu:',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  brandName,
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
                child: Text(
                  'Ngày tạo:',
                  style: DEFAULT_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  createdTime,
                  style: BOLD_TITLE_TEXT_STYLE,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return NeumorphicAppBar(
      title: Text(
        'Thẻ thành viên',
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
}
