// Author: Trung Shin
import 'package:flutter/material.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class TransactionState extends BlocState {
  bool isTransacted;
  bool isTransacting;
  bool hasError;
  String errMsg;
  TransactionState({
    this.isTransacted: false,
    this.isTransacting: false,
    this.hasError: false,
    this.errMsg: '',
  });
  factory TransactionState.transact() {
    return TransactionState(isTransacted: true);
  }
  factory TransactionState.transacting() {
    return TransactionState(isTransacting: true);
  }
  factory TransactionState.error({String errMsg}) {
    return TransactionState(
      hasError: true,
      errMsg: errMsg,
    );
  }
}
