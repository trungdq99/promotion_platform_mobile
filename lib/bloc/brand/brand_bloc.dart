// Author: Trung Shin
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/brand/brand_event.dart';
import 'package:promotion_platform/bloc/brand/brand_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class BrandBloc extends BlocEventStateBase<BrandEvent, BrandState> {
  BrandBloc() : super(initialState: BrandState());
  @override
  Stream<BrandState> eventHandler(
      BrandEvent event, BrandState currentState) async* {
    if (event is BrandEventLoadList) {
      // yield BrandState.loading();
      // List<BrandModel> listBrandModel;
      // listBrandModel = await loadBrands();
      // if (listBrandModel != null) {
      //   yield BrandState.loaded(listBrandModel: listBrandModel);
      // }
    }
  }

  Future<List<BrandModel>> loadBrands() async {
    Repository _repository = Repository();
    Response response = await _repository.fetchBrands();
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
