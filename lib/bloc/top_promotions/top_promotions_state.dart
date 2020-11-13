// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class TopPromotionsState extends BlocState {
  bool isLoad;
  bool isLoading;
  bool isError;
  List<PromotionModel> listPromotion;

  TopPromotionsState({
    this.isLoad: false,
    this.isLoading: false,
    this.isError: false,
    this.listPromotion,
  });

  factory TopPromotionsState.loaded(
      {@required List<PromotionModel> listPromotion}) {
    return TopPromotionsState(
      isLoad: true,
      listPromotion: listPromotion,
    );
  }

  factory TopPromotionsState.loading() {
    return TopPromotionsState(isLoading: true);
  }

  factory TopPromotionsState.error() {
    return TopPromotionsState(isError: true);
  }
}
