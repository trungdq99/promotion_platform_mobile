// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class VoucherPreparationEvent extends BlocEvent {
  final String token;
  final int id;
  VoucherPreparationEvent({
    @required this.token,
    @required this.id,
  });
}

class VoucherPreparationEventUse extends VoucherPreparationEvent {
  VoucherPreparationEventUse({
    @required int id,
    @required String token,
  }) : super(
          id: id,
          token: token,
        );
}

class VoucherPreparationEventCancel extends VoucherPreparationEvent {
  VoucherPreparationEventCancel({@required int id, @required String token})
      : super(
          id: id,
          token: token,
        );
}
