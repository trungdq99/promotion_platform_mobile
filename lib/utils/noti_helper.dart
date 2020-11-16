// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiHelper {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init(Function onDidReceiveLocalNotification,
      Function onSelectNotification) async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await _plugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  static Future<void> show(
      {@required String title, @required String body, String payload}) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'com.ts.promotion_platform', 'Promotion Platform', 'Promotion Platform',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    return _plugin.show(0, title, body, platformChannelSpecifics,
        payload: payload);
  }
}
