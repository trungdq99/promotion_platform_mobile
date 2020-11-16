// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionTransactionState extends BlocState {
  bool isTransacted;
  bool isTransacting;
  bool isError;
  String message;

  PromotionTransactionState({
    this.message: '',
    this.isError: false,
    this.isTransacting: false,
    this.isTransacted: false,
  });

  factory PromotionTransactionState.transacted({@required String message}) {
    return PromotionTransactionState(
      isTransacted: true,
      message: message,
    );
  }

  factory PromotionTransactionState.transacting() {
    return PromotionTransactionState(isTransacting: true);
  }

  factory PromotionTransactionState.error({@required String message}) {
    return PromotionTransactionState(
      isError: true,
      message: message,
    );
  }
}
