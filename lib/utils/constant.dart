import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/utils/custom_widget/icon/icon_home_not_selected.dart';
import 'package:promotion_platform/utils/custom_widget/icon/icon_home_selected.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';
import 'package:promotion_platform/ui/home_screen.dart';
import 'package:promotion_platform/ui/login_screen.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/icon/icon_notification_not_selected.dart';
import 'package:promotion_platform/utils/custom_widget/icon/icon_qrcode_scan_not_selected.dart';
import 'package:promotion_platform/utils/custom_widget/icon/icon_qrcode_scan_selected.dart';
import 'package:promotion_platform/utils/custom_widget/icon/icon_user_not_selected.dart';

import 'custom_widget/icon/icon_gift_not_selected.dart';
import 'custom_widget/icon/icon_gift_selected.dart';
import 'custom_widget/icon/icon_notification_selected.dart';
import 'custom_widget/icon/icon_user_selected.dart';

const String APP_VERSION = '1.0.0';
// API constant
const String BASE_URL = 'https://loyaltyapiws.azurewebsites.net';
const String LOGIN_API = 'api/v1/auth/google';
const String CUSTOMER_API = 'api/v1/customer-info';
const String TOP_BRANDS_API = 'api/v1/brands/top';
const String TOP_PROMOTIONS_API = 'api/v1/promotion-detail/top';
const String TRANSACTION_API = 'api/v1/transaction';
const String MEMBERSHIPS_API = 'api/v1/memberships';
const String CUSTOMER_ACCOUNTS_API = 'api/v1/customerAccount/membershipId';

// List Bottom Navigation Bar Items
List<BottomNavigationBarItem> bottomNavigationBarItems = [
  BottomNavigationBarItem(
    icon: Neumorphic(
      style: neumorphicStyleUpForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconHomeNotSelected(),
      ),
    ),
    activeIcon: Neumorphic(
      style: neumorphicStyleDownForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconHomeSelected(),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Neumorphic(
      style: neumorphicStyleUpForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconGiftNotSelected(),
      ),
    ),
    activeIcon: Neumorphic(
      style: neumorphicStyleDownForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconGiftSelected(),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Neumorphic(
      style: neumorphicStyleUpForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        // color: CustomColors.TEXT_COLOR,
        child: IconQrCodeScanNotSelected(),
      ),
    ),
    activeIcon: Neumorphic(
      style: neumorphicStyleDownForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        // color: CustomColors.TEXT_COLOR,
        child: IconQrCodeScanSelected(),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Neumorphic(
      style: neumorphicStyleUpForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconNotificationNotSelected(),
      ),
    ),
    activeIcon: Neumorphic(
      style: neumorphicStyleDownForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconNotificationSelected(),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Neumorphic(
      style: neumorphicStyleUpForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconUserNotSelected(),
      ),
    ),
    activeIcon: Neumorphic(
      style: neumorphicStyleDownForIcon,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: IconUserSelected(),
      ),
    ),
  ),
];

// Bold title TextStyle
const TextStyle BOLD_TITLE_TEXT_STYLE = TextStyle(
  fontSize: DEFAULT_FONT_SIZE,
  fontWeight: FontWeight.bold,
  color: CustomColors.TEXT_COLOR,
);

// Header TextStyle
const TextStyle HEADER_TEXT_STYLE = TextStyle(
  fontSize: BIG_FONT_SIZE,
  fontWeight: FontWeight.bold,
  color: CustomColors.TEXT_COLOR,
);

// Default TextStyle
const TextStyle DEFAULT_TEXT_STYLE = TextStyle(
  fontSize: DEFAULT_FONT_SIZE,
  color: CustomColors.TEXT_COLOR,
  //fontFamily: 'Segoe UI',
  //fontStyle: FontStyle.italic,
);

// Default TextStyle
const TextStyle POINT_TEXT_STYLE = TextStyle(
  fontSize: DEFAULT_FONT_SIZE,
  color: CustomColors.GREEN,
  //fontFamily: 'Segoe UI',
  //fontStyle: FontStyle.italic,
);

const TextStyle SMALL_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  color: CustomColors.TEXT_COLOR,
  //fontFamily: 'Segoe UI',
);

const TextStyle BOLD_SMALL_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  color: CustomColors.TEXT_COLOR,
  fontWeight: FontWeight.bold,
  //fontFamily: 'Segoe UI',
);

const TextStyle NUM_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  color: CustomColors.BACKGROUND_COLOR,
  fontWeight: FontWeight.bold,
  //fontFamily: 'Segoe UI',
);

const TextStyle BOLD_SUPER_SMALL_TEXT_STYLE = TextStyle(
  fontSize: SUPER_SMALL_FONT_SIZE,
  fontWeight: FontWeight.bold,
  //fontFamily: 'Segoe UI',
  color: CustomColors.TEXT_COLOR,
);

const TextStyle SUPER_SMALL_TEXT_STYLE = TextStyle(
  fontSize: SUPER_SMALL_FONT_SIZE,
  //fontFamily: 'Segoe UI',
  color: CustomColors.TEXT_COLOR,
);

const double DEFAULT_FONT_SIZE = 20;
const double SMALL_FONT_SIZE = 16;
const double SUPER_SMALL_FONT_SIZE = 14;
const double BIG_FONT_SIZE = 24;

// Type of data to save on disk
enum SavingType {
  String,
  Int,
  Bool,
  Double,
  StringList,
}

// UnAuthorize header
const Map<String, String> UN_AUTHORIZE_HEADER = {
  'Content-Type': 'application/json; charset=UTF-8',
};

// Request method
enum RequestMethod {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

// Key to save data on disk
const String ACCESS_TOKEN_KEY = 'access_token';

final NeumorphicStyle neumorphicStyleUpWithHighRadius = NeumorphicStyle(
  border: neumorphicBorderDefault,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(72)),
);

final NeumorphicStyle neumorphicStyleDownWithHighRadius = NeumorphicStyle(
  border: neumorphicBorderDefault,
  depth: -20,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(72)),
);

final NeumorphicStyle neumorphicStyleUpWithSmallRadius = NeumorphicStyle(
  border: neumorphicBorderDefault,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
);

final NeumorphicStyle neumorphicStyleDownWithSmallRadius = NeumorphicStyle(
  border: neumorphicBorderDefault,
  depth: -20,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
);

final NeumorphicStyle neumorphicStyleDownForIcon = NeumorphicStyle(
  border: neumorphicBorderDefault,
  depth: -20,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
);

final NeumorphicStyle neumorphicStyleUpForIcon = NeumorphicStyle(
  border: neumorphicBorderDefault,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
);

final NeumorphicBorder neumorphicBorderDefault = NeumorphicBorder(
  color: Color(0xfffffcfc),
  width: 0.8,
  isEnabled: true,
);

final NeumorphicStyle neumorphicStyleUpDefault = NeumorphicStyle(
  border: neumorphicBorderDefault,
  boxShape: NeumorphicBoxShape.rect(),
);

final NeumorphicStyle neumorphicStyleForAlert = NeumorphicStyle(
  border: neumorphicBorderDefault,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
);

final NeumorphicStyle neumorphicStyleDownDefault = NeumorphicStyle(
  border: neumorphicBorderDefault,
  depth: -20,
  boxShape: NeumorphicBoxShape.rect(),
);

final NeumorphicStyle neumorphicStyleUpCircle = NeumorphicStyle(
  border: neumorphicBorderDefault,
  boxShape: NeumorphicBoxShape.circle(),
);

final NeumorphicStyle neumorphicStyleDownCircle = NeumorphicStyle(
  border: neumorphicBorderDefault,
  depth: -20,
  boxShape: NeumorphicBoxShape.circle(),
);

final NeumorphicStyle neumorphicStyleDownCircleForNum = NeumorphicStyle(
  border: neumorphicBorderDefault,
  depth: 20,
  boxShape: NeumorphicBoxShape.circle(),
  // lightSource: LightSource.bottomRight,
);

const int TIME_DELAY = 100;
