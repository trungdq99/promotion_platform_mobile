import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/ui/brand_detail_screen.dart';
import 'package:promotion_platform/ui/home_screen.dart';
import 'package:promotion_platform/ui/login_screen.dart';

// API constant
const String BASE_URL = 'https://loyaltyapipipe.azurewebsites.net';
const String LOGIN_API = 'api/v1/auth/google';
const String CUSTOMER_API = 'api/v1/customer-info';
const String BRANDS_API = 'api/v1/brands';

// List Bottom Navigation Bar Items
const List<BottomNavigationBarItem> BOTTOM_NAVIGATION_BAR_ITEMS = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: Colors.grey,
      size: 24,
    ),
    activeIcon: Icon(
      Icons.home,
      color: Colors.teal,
      size: 32,
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.card_giftcard,
      color: Colors.grey,
      size: 24,
    ),
    activeIcon: Icon(
      Icons.card_giftcard,
      color: Colors.teal,
      size: 32,
    ),
  ),
  BottomNavigationBarItem(
    icon: CircleAvatar(
      backgroundColor: Colors.teal,
      child: Icon(
        Icons.qr_code,
        color: Colors.white,
        size: 30,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.notifications,
      color: Colors.grey,
      size: 24,
    ),
    activeIcon: Icon(
      Icons.notifications,
      color: Colors.teal,
      size: 32,
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.person,
      color: Colors.grey,
      size: 24,
    ),
    activeIcon: Icon(
      Icons.person,
      color: Colors.teal,
      size: 32,
    ),
  ),
];

// Bold title TextStyle
const TextStyle BOLD_TITLE_TEXT_STYLE = TextStyle(
  fontSize: DEFAULT_FONT_SIZE,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

// Header TextStyle
const TextStyle HEADER_TEXT_STYLE = TextStyle(
  fontSize: BIG_FONT_SIZE,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

// Default TextStyle
const TextStyle DEFAULT_TEXT_STYLE = TextStyle(
  fontSize: DEFAULT_FONT_SIZE,
  color: Colors.black,
  fontFamily: 'Segoe UI',
  //fontStyle: FontStyle.italic,
);

const TextStyle SMALL_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  color: Colors.black,
  fontFamily: 'Segoe UI',
);

const TextStyle BOLD_SMALL_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Segoe UI',
);

const TextStyle SUPER_SMALL_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  fontFamily: 'Segoe UI',
  //color: Colors.black,
);

const double DEFAULT_FONT_SIZE = 20;
const double SMALL_FONT_SIZE = 16;
const double SUPER_SMALL_FONT_SIZE = 12;
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

final Map<String, WidgetBuilder> listRoutes = {
  //'/authentication': (BuildContext context) => AuthenticationPage(),
  '/home': (BuildContext context) => HomeScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/brand_detail': (BuildContext context) => BrandDetailScreen(),
};

final NeumorphicStyle neumorphicStyleUp = NeumorphicStyle(
  border: NeumorphicBorder(
    color: Color(0xfffffcfc),
    width: 0.8,
    isEnabled: true,
  ),
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(72)),
);

final NeumorphicStyle neumorphicStyleDown = NeumorphicStyle(
  border: NeumorphicBorder(
    color: Color(0xfffffcfc),
    width: 0.8,
    isEnabled: true,
  ),
  depth: -20,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(72)),
);
