// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionsState extends BlocState {
  bool isLoaded;
  bool isLoading;
  bool isError;
  String message;
  List<PromotionModel> listPromotionModel;

  PromotionsState({
    this.message: '',
    this.isLoading: false,
    this.isError: false,
    this.isLoaded: false,
    this.listPromotionModel,
  });

  factory PromotionsState.loaded(
      {@required List<PromotionModel> listPromotionModel}) {
    return PromotionsState(
      isLoaded: true,
      listPromotionModel: listPromotionModel,
    );
  }

  factory PromotionsState.loading() {
    return PromotionsState(
      isLoading: true,
    );
  }

  factory PromotionsState.error({@required String message}) {
    return PromotionsState(
      isError: true,
      message: message,
    );
  }
}
