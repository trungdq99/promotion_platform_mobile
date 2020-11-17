// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/promotions/promotions_event.dart';
import 'package:promotion_platform/bloc/promotions/promotions_state.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class PromotionsBloc
    extends BlocEventStateBase<PromotionsEvent, PromotionsState> {
  PromotionsBloc() : super(initialState: PromotionsState());

  @override
  Stream<PromotionsState> eventHandler(
    PromotionsEvent event,
    PromotionsState currentState,
  ) async* {
    if (event is PromotionsEventLoad) {
      yield PromotionsState.loading();
      List<PromotionModel> listPromotion;
      if (event.categoryId == 0) {
        for (int i = 1; i < 6; i++) {
          List<PromotionModel> list;
          list = await loadPromotions(
            search: event.search,
            pageId: event.pageId,
            filterId: event.filterId,
            categoryId: i,
          );
          if (list == null) {
            yield PromotionsState.error(message: 'Something went wrong!');
          } else {
            if (listPromotion == null) {
              listPromotion = [];
            }
            listPromotion.addAll(list);
          }
        }
      } else {
        listPromotion = await loadPromotions(
          search: event.search,
          pageId: event.pageId,
          filterId: event.filterId,
          categoryId: event.categoryId,
        );
      }

      if (listPromotion == null) {
        yield PromotionsState.error(message: 'Something went wrong!');
      } else {
        yield PromotionsState.loaded(listPromotionModel: listPromotion);
      }
    }
  }

  Future<List<PromotionModel>> loadPromotions({
    @required int categoryId,
    @required int filterId,
    @required int pageId,
    @required String search,
  }) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchPromotions(
      categoryId: categoryId,
      filterId: filterId,
      pageId: pageId,
      search: search,
    );
    print(response.statusCode);
    print(response.body);
    List<PromotionModel> listPromotion;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        listPromotion = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          PromotionModel promotionModel = PromotionModel.fromMap(map);
          listPromotion.add(promotionModel);
        });
      }
    }
    return listPromotion;
  }
}
