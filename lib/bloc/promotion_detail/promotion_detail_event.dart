// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionDetailEvent extends BlocEvent {
  final int id;
  PromotionDetailEvent({@required this.id});
}

class PromotionDetailEventLoad extends PromotionDetailEvent {
  PromotionDetailEventLoad({@required int id}) : super(id: id);
}
