// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/voucher_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class VouchersState extends BlocState {
  bool isLoaded;
  bool isLoading;
  bool isError;
  String message;
  List<VoucherModel> listVoucherModel;

  VouchersState({
    this.message: '',
    this.isError: false,
    this.isLoading: false,
    this.isLoaded: false,
    this.listVoucherModel,
  });

  factory VouchersState.loaded(
      {@required List<VoucherModel> listVoucherModel}) {
    return VouchersState(
      isLoaded: true,
      listVoucherModel: listVoucherModel,
    );
  }

  factory VouchersState.loading() {
    return VouchersState(
      isLoading: true,
    );
  }

  factory VouchersState.error({@required String message}) {
    return VouchersState(
      isError: true,
      message: message,
    );
  }
}
