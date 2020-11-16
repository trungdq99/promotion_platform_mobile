// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PointCollectionState extends BlocState {
  bool isCollected;
  bool isCollecting;
  bool isError;
  String message;

  PointCollectionState({
    this.message: '',
    this.isError: false,
    this.isCollected: false,
    this.isCollecting: false,
  });

  factory PointCollectionState.collected({@required String message}) {
    return PointCollectionState(
      message: message,
      isCollected: true,
    );
  }

  factory PointCollectionState.collecting() {
    return PointCollectionState(isCollecting: true);
  }

  factory PointCollectionState.error({@required String message}) {
    return PointCollectionState(
      isError: true,
      message: message,
    );
  }
}
