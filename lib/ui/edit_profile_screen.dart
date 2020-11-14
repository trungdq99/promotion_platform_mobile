// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_alert.dart';
import 'package:promotion_platform/utils/custom_widget/custom_network_image.dart';
import 'package:promotion_platform/utils/custom_widget/custom_text_field.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/custom_widget/select_gender_widget.dart';
import 'package:promotion_platform/utils/helper.dart';

class EditProfileScreen extends StatefulWidget {
  final CustomerModel customerModel;
  EditProfileScreen({@required this.customerModel});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _firstNameController;
  TextEditingController _familyNameController;
  TextEditingController _phoneController;
  TextEditingController _emailController;
  String _birthdayStr;
  String _genderStr;
  CustomerBloc _customerBloc;
  AuthenticationBloc _authenticationBloc;
  String token;
  @override
  void initState() {
    List<String> splitName = Helper.splitName(widget.customerModel.name);

    _firstNameController = TextEditingController(text: splitName[0]);
    _familyNameController = TextEditingController(text: splitName[1]);
    _phoneController = TextEditingController(text: widget.customerModel.phone);
    _emailController = TextEditingController(text: widget.customerModel.email);
    _birthdayStr = Helper.convertDateToString(
        Helper.convertStringToDateTimeVer2(widget.customerModel.birthDay));
    _genderStr = Helper.convertGenderToString(widget.customerModel.gender);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: BlocEventStateBuilder<AuthenticationState>(
            bloc: _authenticationBloc,
            builder: (context, state) {
              if (state.isAuthenticated) {
                token = state.token;
              }
              return BlocEventStateBuilder<CustomerState>(
                bloc: _customerBloc,
                builder: (context, state) {
                  // if (state.isUpdated) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return CustomAlert(
                  //         errMsg: state.message,
                  //       );
                  //     },
                  //   );
                  // }
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildAvatar(),
                            _buildUsername(),
                            _buildNameTextField(),
                            _buildBirthdayAndGender(),
                            _buildPhoneTextField(),
                            _buildEmailTextField(),
                          ],
                        ),
                      ),
                      state.isLoading ? FullScreenProgressing() : Container(),
                      state.isUpdated
                          ? CustomAlert(errMsg: state.message)
                          : SizedBox(),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUsername() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        widget.customerModel.name,
        style: HEADER_TEXT_STYLE,
      ),
    );
  }

  Widget _buildBirthdayAndGender() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildBirthday(),
        ),
        Expanded(
          flex: 1,
          child: _buildGender(),
        ),
      ],
    );
  }

  NeumorphicButton _buildBirthday() {
    return NeumorphicButton(
      style: neumorphicStyleUpWithSmallRadius,
      margin: EdgeInsets.only(
        left: 32,
        top: 8,
        bottom: 16,
        right: 16,
      ),
      padding: EdgeInsets.all(8),
      onPressed: () async {
        await Helper.navigationDelay();
        DatePicker.showDatePicker(
          context,
          dateFormat: 'dd/MM/yyyy',
          onConfirm: (dateTime, selectedIndex) {
            setState(() {
              _birthdayStr = Helper.convertDateToString(dateTime);
            });
          },
          initialDateTime: Helper.convertStringToDateTime(_birthdayStr),
        );
      },
      child: Row(
        children: [
          Neumorphic(
            style: neumorphicStyleDownCircle,
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.calendar_today,
              size: 24,
              color: CustomColors.TEXT_COLOR,
            ),
          ),
          Expanded(
            child: Text(
              _birthdayStr,
              style: SUPER_SMALL_TEXT_STYLE,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void showSelectGenderDialog() async {
    await Helper.navigationDelay();
    List result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SelectGenderWidget(
          selectedIndex: Helper.convertGenderToIndex(
              Helper.convertStringToGender(_genderStr)),
        );
      },
      backgroundColor: CustomColors.BACKGROUND_COLOR,
    );
    if (result != null) {
      int value = result[0] ?? 0;
      bool isChange = result[1] ?? false;
      if (isChange) {
        setState(() {
          _genderStr =
              Helper.convertGenderToString(Helper.convertIndexToGender(value));
        });
      }
    }
  }

  Widget _buildGender() {
    return NeumorphicButton(
      style: neumorphicStyleUpWithSmallRadius,
      margin: EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 16,
        right: 32,
      ),
      padding: EdgeInsets.all(8),
      onPressed: () {
        showSelectGenderDialog();
      },
      child: Row(
        children: [
          Neumorphic(
            style: neumorphicStyleDownCircle,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(0),
            child: Icon(
              Icons.people_alt_outlined,
              size: 24,
              color: CustomColors.TEXT_COLOR,
            ),
          ),
          Expanded(
            child: Text(
              _genderStr,
              style: SUPER_SMALL_TEXT_STYLE,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: _emailController,
      margin: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      padding: EdgeInsets.all(8),
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Neumorphic(
        style: neumorphicStyleDownCircle,
        child: Icon(
          Icons.email,
          size: 24,
          color: CustomColors.TEXT_COLOR,
        ),
      ),
      enable: false,
    );
  }

  Widget _buildPhoneTextField() {
    return CustomTextField(
      controller: _phoneController,
      margin: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      padding: EdgeInsets.all(8),
      hintText: 'Số điện thoại',
      keyboardType: TextInputType.phone,
      maxLength: 10,
      prefixIcon: Neumorphic(
        style: neumorphicStyleDownCircle,
        child: Icon(
          Icons.phone,
          size: 24,
          color: CustomColors.TEXT_COLOR,
        ),
      ),
      enable: false,
    );
  }

  Widget _buildAvatar() {
    return NeumorphicButton(
      onPressed: () {},
      style: neumorphicStyleUpCircle,
      padding: EdgeInsets.all(0),
      child: Container(
        width: 184,
        height: 184,
        color: Colors.teal,
        child: widget.customerModel.picUrl.isEmpty
            ? Text('AVATAR')
            : CustomNetworkImage(
                imgUrl: widget.customerModel.picUrl,
                width: 184,
                height: 184,
              ),
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildNameTextField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomTextField(
            controller: _firstNameController,
            margin: EdgeInsets.only(
              top: 8,
              left: 32,
              right: 16,
              bottom: 8,
            ),
            padding: EdgeInsets.all(0),
            hintText: 'Tên',
            keyboardType: TextInputType.name,
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomTextField(
            controller: _familyNameController,
            margin: EdgeInsets.only(
              top: 8,
              left: 16,
              right: 32,
              bottom: 8,
            ),
            padding: EdgeInsets.all(0),
            hintText: 'Họ',
            keyboardType: TextInputType.name,
          ),
        ),
      ],
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
          Icons.close,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
      actions: [
        NeumorphicButton(
          style: neumorphicStyleUpCircle,
          onPressed: () async {
            await Helper.navigationDelay();
            CustomerModel customerModel = widget.customerModel;
            customerModel.gender = Helper.convertStringToGender(_genderStr);
            customerModel.name =
                _firstNameController.text + ' ' + _familyNameController.text;
            customerModel.birthDay = Helper.convertDateToStringVer2(
                Helper.convertStringToDateTime(_birthdayStr));
            if (token != null && token.isNotEmpty && customerModel != null) {
              _customerBloc.emitEvent(
                CustomerEventUpdate(token: token, customerModel: customerModel),
              );
            }
          },
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.done,
            color: CustomColors.TEXT_COLOR,
            size: BIG_FONT_SIZE,
          ),
        ),
      ],
    );
  }
}
