// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class HistoryEvent extends BlocEvent {
  final String token;
  HistoryEvent({@required this.token});
}

class HistoryEventLoad extends HistoryEvent {
  HistoryEventLoad({@required String token}) : super(token: token);
}
