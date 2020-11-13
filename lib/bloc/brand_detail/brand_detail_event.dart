// Author: Trung Shin

import 'package:flutter/widgets.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class BrandDetailEvent extends BlocEvent {
  final int brandId;
  BrandDetailEvent({@required this.brandId});
}

class BrandDetailEventLoad extends BrandDetailEvent {
  BrandDetailEventLoad({@required int brandId}) : super(brandId: brandId);
}
