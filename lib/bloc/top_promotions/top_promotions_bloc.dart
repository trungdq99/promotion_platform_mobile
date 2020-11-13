// Author: Trung Shin

import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/top_promotions/top_promotions_event.dart';
import 'package:promotion_platform/bloc/top_promotions/top_promotions_state.dart';
import 'package:promotion_platform/models/promotion_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class TopPromotionsBloc
    extends BlocEventStateBase<TopPromotionsEvent, TopPromotionsState> {
  TopPromotionsBloc() : super(initialState: TopPromotionsState());
  @override
  Stream<TopPromotionsState> eventHandler(
      TopPromotionsEvent event, TopPromotionsState currentState) async* {
    if (event is TopPromotionsEventLoad) {
      yield TopPromotionsState.loading();
      List<PromotionModel> listPromotion;
      listPromotion = await loadPromotions();
      if (listPromotion != null) {
        yield TopPromotionsState.loaded(listPromotion: listPromotion);
      } else {
        yield TopPromotionsState.error();
      }
    }
  }

  Future<List<PromotionModel>> loadPromotions() async {
    Repository _repository = Repository();
    Response response = await _repository.fetchTopPromotions();
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
