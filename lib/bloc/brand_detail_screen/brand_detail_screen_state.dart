// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class BrandDetailScreenState extends BlocState {
  bool isOpen;
  bool isOpening;
  bool isError;
  BrandModel brandModel;

  BrandDetailScreenState({
    this.isOpen: false,
    this.isOpening: false,
    this.isError: false,
    this.brandModel,
  });

  factory BrandDetailScreenState.opened({@required BrandModel brandModel}) {
    return BrandDetailScreenState(
      isOpen: true,
      brandModel: brandModel,
    );
  }

  factory BrandDetailScreenState.opening() {
    return BrandDetailScreenState(isOpening: true);
  }

  factory BrandDetailScreenState.error() {
    return BrandDetailScreenState(isError: true);
  }
}
