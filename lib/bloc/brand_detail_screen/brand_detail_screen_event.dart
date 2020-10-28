// Author: Trung Shin

import 'package:flutter/foundation.dart';

import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class BrandDetailScreenEvent extends BlocEvent {
  final int brandId;
  BrandDetailScreenEvent({this.brandId});
}

class BrandDetailScreenEventOpen extends BrandDetailScreenEvent {
  BrandDetailScreenEventOpen({@required int brandId}) : super(brandId: brandId);
}

class BrandDetailScreenEventClose extends BrandDetailScreenEvent {}
