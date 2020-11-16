// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionDetailState extends BlocState {
  bool isLoaded;
  bool isLoading;
  bool isError;
  String message;
  PromotionModel promotionModel;

  PromotionDetailState({
    this.isLoaded: false,
    this.isLoading: false,
    this.isError: false,
    this.message: '',
    this.promotionModel,
  });

  factory PromotionDetailState.loaded(
      {@required PromotionModel promotionModel}) {
    return PromotionDetailState(
      isLoaded: true,
      promotionModel: promotionModel,
    );
  }

  factory PromotionDetailState.loading() {
    return PromotionDetailState(
      isLoading: true,
    );
  }

  factory PromotionDetailState.error({@required String message}) {
    return PromotionDetailState(
      isError: true,
      message: message,
    );
  }
}
