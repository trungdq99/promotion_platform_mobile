// Author: Trung Shin
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/top_brands/top_brands_event.dart';
import 'package:promotion_platform/bloc/top_brands/top_brands_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class TopBrandsBloc extends BlocEventStateBase<TopBrandsEvent, TopBrandsState> {
  TopBrandsBloc() : super(initialState: TopBrandsState());
  @override
  Stream<TopBrandsState> eventHandler(
      TopBrandsEvent event, TopBrandsState currentState) async* {
    if (event is TopBrandsEventLoad) {
      yield TopBrandsState.loading();
      List<BrandModel> listBrandModel;
      listBrandModel = await loadBrands();
      if (listBrandModel != null) {
        yield TopBrandsState.loaded(listBrandModel: listBrandModel);
      } else {
        yield TopBrandsState.error();
      }
    }
  }

  Future<List<BrandModel>> loadBrands() async {
    Repository _repository = Repository();
    Response response = await _repository.fetchTopBrands();
    print(response.statusCode);
    print(response.body);
    List<BrandModel> listBrandModel;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        listBrandModel = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          BrandModel brandModel = BrandModel.fromMap(map);
          listBrandModel.add(brandModel);
        });
      }
    }
    return listBrandModel;
  }
}
