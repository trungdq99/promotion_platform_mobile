import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
);

const TextStyle SMALL_TEXT_STYLE = TextStyle(
  fontSize: SMALL_FONT_SIZE,
  color: Colors.black,
);
const double DEFAULT_FONT_SIZE = 20;
const double SMALL_FONT_SIZE = 16;
const double BIG_FONT_SIZE = 24;
