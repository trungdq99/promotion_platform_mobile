// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PointCollectionEvent extends BlocEvent {
  final String token;
  final String qrCode;

  PointCollectionEvent({
    @required this.token,
    @required this.qrCode,
  });
}

class PointCollectionEventCollect extends PointCollectionEvent {
  PointCollectionEventCollect({
    @required String token,
    @required String qrCode,
  }) : super(
          token: token,
          qrCode: qrCode,
        );
}
