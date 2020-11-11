// Author: Trung Shin
import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class MembershipsEvent extends BlocEvent {
  final String token;
  MembershipsEvent({@required this.token});
}

class MembershipsEventLoad extends MembershipsEvent {
  MembershipsEventLoad({@required String token}) : super(token: token);
}
