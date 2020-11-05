// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class CustomerEvent extends BlocEvent {
  final String token;
  CustomerEvent({@required this.token});
}

class CustomerEventLoad extends CustomerEvent {
  CustomerEventLoad({@required String token}) : super(token: token);
}

class CustomerEventUpdate extends CustomerEvent {
  CustomerEventUpdate({
    @required String token,
  }) : super(token: token);
}
