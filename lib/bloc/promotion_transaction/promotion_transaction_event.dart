// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionTransactionEvent extends BlocEvent {
  final String token;
  final int voucherGroupId;
  PromotionTransactionEvent({
    @required this.token,
    @required this.voucherGroupId,
  });
}

class PromotionTransactionEventTransact extends PromotionTransactionEvent {
  PromotionTransactionEventTransact({
    @required String token,
    @required int voucherGroupId,
  }) : super(
          voucherGroupId: voucherGroupId,
          token: token,
        );
}
