// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class NotificationEvent extends BlocEvent {
  final String message;

  NotificationEvent({this.message});
}

class NotificationEventGetMessage extends NotificationEvent {
  NotificationEventGetMessage({@required String message})
      : super(message: message);
}
