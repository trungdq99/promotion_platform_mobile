import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_event.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/ui/edit_profile_screen.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';

class TabProfileScreen extends StatefulWidget {
  final BuildContext homeContext;
  TabProfileScreen({
    @required this.homeContext,
  });
  @override
  _TabProfileScreenState createState() => _TabProfileScreenState();
}

class _TabProfileScreenState extends State<TabProfileScreen> {
  double deviceWidth;
  CustomerBloc _customerBloc;
  CustomerModel _customerModel;
  @override
  Widget build(BuildContext context) {
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocEventStateBuilder<CustomerState>(
        builder: (context, customerState) {
          if (customerState.isLoad) {
            _customerModel = customerState.customerModel;
          }
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAppBar(),
                      _buildButton(
                        title: 'Thành viên vàng',
                        iconData: Icons.leaderboard,
                      ),
                      _buildButton(
                        title: 'Quà đã đổi',
                        iconData: Icons.card_giftcard,
                      ),
                      _buildButton(
                        title: 'Lịch sử Bean',
                        iconData: Icons.history,
                      ),
                      _buildButton(
                        title: 'Thương hiệu',
                        iconData: Icons.shop,
                      ),
                      _buildButton(
                        title: 'Game',
                        iconData: Icons.videogame_asset,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      _buildButton(
                        title: 'Về Uni Bean',
                      ),
                      _buildButton(
                        title: 'Hỗ trợ',
                        iconData: Icons.settings_input_svideo,
                      ),
                      _buildButton(
                        title: 'Cài đặt',
                        iconData: Icons.settings,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      _buildButton(
                          title: 'Đăng xuất',
                          iconData: Icons.logout,
                          function: () {
                            _authenticationBloc
                                .emitEvent(AuthenticationEventSignOut());
                          }),
                    ],
                  ),
                ),
              )
            ],
          );
        },
        bloc: _customerBloc,
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      width: deviceWidth,
      child: Stack(
        children: [
          Row(
            children: [
              // NeumorphicButton(
              //   style: neumorphicStyleUpCircle,
              //   onPressed: () {
              //     Navigator.push(
              //       widget.homeContext,
              //       CupertinoPageRoute(
              //         builder: (context) => EditProfileScreen(
              //           name: 'Trung Shin',
              //           birthday: '17/05/1999',
              //           email: 'nhocchjpts99@gmail.com',
              //           gender: true,
              //           phone: '0917920689',
              //         ),
              //         fullscreenDialog: true,
              //       ),
              //     );
              //     // Navigator.of(homeContext).push(CupertinoPageRoute(
              //     //   builder: (context) => EditProfileScreen(),
              //     //   fullscreenDialog: true,
              //     // ));
              //   },
              //   padding: EdgeInsets.all(0),
              //   child: Container(
              //     height: 68,
              //     width: 68,
              //     alignment: Alignment.center,
              //     color: Colors.teal,
              //     child: Text('Avatar'),
              //   ),
              // ),
              Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: _customerModel != null
                    ? Image.network(
                        _customerModel.picUrl,
                        height: 68,
                        width: 68,
                      )
                    : Container(
                        height: 68,
                        width: 68,
                        color: CustomColors.GREEN,
                        alignment: Alignment.center,
                        child: Text('Avatar'),
                      ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _customerModel != null ? _customerModel.name : 'User Name',
                    style: BOLD_TITLE_TEXT_STYLE,
                  ),
                  InkWell(
                    onTap: () {
                      String name = '';
                      String birthday = '';
                      String email = '';
                      bool gender;
                      String phone = '';
                      String picUrl = '';
                      if (_customerModel != null) {
                        name = _customerModel.name;
                        birthday = _customerModel.birthDay;
                        email = _customerModel.email;
                        gender = _customerModel.gender;
                        phone = _customerModel.phone;
                        picUrl = _customerModel.picUrl;
                      }
                      Navigator.push(
                        widget.homeContext,
                        CupertinoPageRoute(
                          builder: (context) => EditProfileScreen(
                            name: name,
                            birthday: birthday,
                            email: email,
                            gender: gender,
                            phone: phone,
                            picUrl: picUrl,
                          ),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Text(
                      'Sửa thông tin',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: Point(
              point: _customerModel != null ? _customerModel.lastBalance : 1000,
              hasBorder: true,
              function: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    IconData iconData: Icons.settings,
    String title: '',
    Function function,
  }) {
    return NeumorphicButton(
      onPressed: function ?? () {},
      style: neumorphicStyleUpWithSmallRadius,
      margin: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 4,
      ),
      padding: EdgeInsets.all(16),
      child: Container(
        // height: ,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: DEFAULT_TEXT_STYLE,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: CustomColors.TEXT_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
