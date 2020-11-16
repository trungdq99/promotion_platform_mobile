// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class VouchersEvent extends BlocEvent {
  final String token;
  VouchersEvent({@required this.token});
}

class VouchersEventLoad extends VouchersEvent {
  VouchersEventLoad({@required String token}) : super(token: token);
}
