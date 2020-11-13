// Author: Trung Shin

import 'package:flutter/widgets.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class BrandDetailState extends BlocState {
  bool isLoad;
  bool isLoading;
  bool hasError;
  String errMsg;
  BrandModel brandModel;

  BrandDetailState({
    this.isLoad: false,
    this.isLoading: false,
    this.errMsg: '',
    this.brandModel,
    this.hasError: false,
  });

  factory BrandDetailState.loaded({@required BrandModel brandModel}) {
    return BrandDetailState(
      isLoad: true,
      brandModel: brandModel,
    );
  }

  factory BrandDetailState.loading() {
    return BrandDetailState(
      isLoading: true,
    );
  }

  factory BrandDetailState.error({@required String errMsg}) {
    return BrandDetailState(
      hasError: true,
      errMsg: errMsg,
    );
  }
}
