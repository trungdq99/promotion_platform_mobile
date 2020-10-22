import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show json;

class Helper {
  static saveData(String key, dynamic value, SavingType type) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switch (type) {
      case SavingType.String:
        pref.setString(key, value);
        break;
      case SavingType.Int:
        pref.setInt(key, value);
        break;
      case SavingType.Bool:
        pref.setBool(key, value);
        break;
      case SavingType.Double:
        pref.setDouble(key, value);
        break;
      case SavingType.StringList:
        pref.setStringList(key, value);
        break;
    }
  }

  static Future loadData(String key, SavingType type) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switch (type) {
      case SavingType.String:
        return (pref.getString(key) ?? null);
        break;
      case SavingType.Int:
        return (pref.getInt(key) ?? null);
        break;
      case SavingType.Bool:
        return (pref.getBool(key) ?? null);
        break;
      case SavingType.Double:
        return (pref.getDouble(key) ?? null);
        break;
      case SavingType.StringList:
        return (pref.getStringList(key) ?? null);
        break;
    }
  }

  static removeData(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }

  static Map<String, String> getAuthorizeHeader(String accessToken) {
    Map<String, String> authorizeHeader = {};
    authorizeHeader.addAll(UN_AUTHORIZE_HEADER);
    authorizeHeader.addAll({'Authorization': 'bearer $accessToken'});
    return authorizeHeader;
  }

  static String encodeJson(Object value) => json.encode(value);
  static dynamic decodeJson(String value) => json.decode(value);

  static String currencyFormat(dynamic number) {
    return NumberFormat.currency(decimalDigits: 0, symbol: 'VNĐ', locale: 'vi')
        .format(number);
  }

  static String decimalPatternFormat(dynamic number) {
    return NumberFormat.decimalPattern().format(number);
  }

  static String convertDateToString(DateTime date) {
    return DateFormat('yy/MM/dd').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
