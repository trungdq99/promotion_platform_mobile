// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class BrandState extends BlocState {
  bool isLoad;
  bool isLoading;
  bool isError;
  List<BrandModel> listBrandModel;
  BrandState({
    this.isLoad: false,
    this.isLoading: false,
    this.isError: false,
    this.listBrandModel,
  });

  factory BrandState.loaded({@required List<BrandModel> listBrandModel}) {
    return BrandState(
      isLoad: true,
      listBrandModel: listBrandModel,
    );
  }
  factory BrandState.loading() {
    return BrandState(
      isLoading: true,
    );
  }
  factory BrandState.error() {
    return BrandState(
      isError: true,
    );
  }
}
