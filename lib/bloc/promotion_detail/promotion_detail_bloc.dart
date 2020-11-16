// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/promotion_detail/promotion_detail_event.dart';
import 'package:promotion_platform/bloc/promotion_detail/promotion_detail_state.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class PromotionDetailBloc
    extends BlocEventStateBase<PromotionDetailEvent, PromotionDetailState> {
  PromotionDetailBloc() : super(initialState: PromotionDetailState());

  @override
  Stream<PromotionDetailState> eventHandler(
    PromotionDetailEvent event,
    PromotionDetailState currentState,
  ) async* {
    if (event is PromotionDetailEventLoad) {
      yield PromotionDetailState.loading();
      PromotionModel promotionModel;
      promotionModel = await loadPromotion(id: event.id);
      if (promotionModel == null) {
        yield PromotionDetailState.error(message: 'Something went wrong!');
      } else {
        yield PromotionDetailState.loaded(promotionModel: promotionModel);
      }
    }
  }

  Future<PromotionModel> loadPromotion({@required int id}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchPromotionDetail(id: id);
    print(response.statusCode);
    print(response.body);
    PromotionModel promotionModel;
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        promotionModel = PromotionModel.fromMap(responseBody);
      }
    }
    return promotionModel;
  }
}
