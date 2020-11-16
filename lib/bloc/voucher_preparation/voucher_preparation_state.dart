// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class VoucherPreparationState extends BlocState {
  bool isUpdated;
  bool isUpdating;
  bool isError;
  String message;

  VoucherPreparationState({
    this.message: '',
    this.isError: false,
    this.isUpdated: false,
    this.isUpdating: false,
  });

  factory VoucherPreparationState.updated({@required String message}) {
    return VoucherPreparationState(
      isUpdated: true,
      message: message,
    );
  }

  factory VoucherPreparationState.updating() {
    return VoucherPreparationState(isUpdating: true);
  }

  factory VoucherPreparationState.error({@required String message}) {
    return VoucherPreparationState(
      isError: true,
      message: message,
    );
  }
}
