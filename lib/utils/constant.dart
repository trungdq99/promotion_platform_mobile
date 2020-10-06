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
