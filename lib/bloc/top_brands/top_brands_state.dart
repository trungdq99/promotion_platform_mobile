// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class TopBrandsState extends BlocState {
  bool isLoad;
  bool isLoading;
  bool isError;
  List<BrandModel> listBrandModel;
  TopBrandsState({
    this.isLoad: false,
    this.isLoading: false,
    this.isError: false,
    this.listBrandModel,
  });

  factory TopBrandsState.loaded({@required List<BrandModel> listBrandModel}) {
    return TopBrandsState(
      isLoad: true,
      listBrandModel: listBrandModel,
    );
  }
  factory TopBrandsState.loading() {
    return TopBrandsState(
      isLoading: true,
    );
  }
  factory TopBrandsState.error() {
    return TopBrandsState(
      isError: true,
    );
  }
}
