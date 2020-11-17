// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class NotificationState extends BlocState {
  bool hasMessage;
  String message;

  NotificationState({
    this.message: '',
    this.hasMessage: false,
  });

  factory NotificationState.hasMessage({@required String message}) {
    return NotificationState(
      message: message,
      hasMessage: true,
    );
  }
}
