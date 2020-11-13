// Author: Trung Shin

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/brand_detail/brand_detail_event.dart';
import 'package:promotion_platform/bloc/brand_detail/brand_detail_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class BrandDetailBloc
    extends BlocEventStateBase<BrandDetailEvent, BrandDetailState> {
  BrandDetailBloc() : super(initialState: BrandDetailState());

  @override
  Stream<BrandDetailState> eventHandler(
      BrandDetailEvent event, BrandDetailState currentState) async* {
    if (event is BrandDetailEventLoad) {
      yield BrandDetailState.loading();
      BrandModel brandModel;
      brandModel = await loadBrand(brandId: event.brandId);
      if (brandModel == null) {
        yield BrandDetailState.error(errMsg: 'Something went wrong!');
      } else {
        yield BrandDetailState.loaded(brandModel: brandModel);
      }
    }
  }

  Future<BrandModel> loadBrand({@required int brandId}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchBrandDetail(brandId: brandId);
    print(response.statusCode);
    print(response.body);
    BrandModel brandModel;
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        brandModel = BrandModel.fromMap(responseBody);
      }
    }
    return brandModel;
  }
}
