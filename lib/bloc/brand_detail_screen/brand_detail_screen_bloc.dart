// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_event.dart';
import 'package:promotion_platform/bloc/brand_detail_screen/brand_detail_screen_state.dart';
import 'package:promotion_platform/models/brand_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class BrandDetailScreenBloc
    extends BlocEventStateBase<BrandDetailScreenEvent, BrandDetailScreenState> {
  BrandDetailScreenBloc() : super(initialState: BrandDetailScreenState());
  @override
  Stream<BrandDetailScreenState> eventHandler(BrandDetailScreenEvent event,
      BrandDetailScreenState currentState) async* {
    if (event is BrandDetailScreenEventOpen) {
      yield BrandDetailScreenState.opening();
      BrandModel brandModel;
      brandModel = await loadBrandDetail(id: event.brandId);
      if (brandModel == null) {
        yield BrandDetailScreenState.error();
      } else {
        yield BrandDetailScreenState.opened(brandModel: brandModel);
      }
    } else if (event is BrandDetailScreenEventClose) {
      yield BrandDetailScreenState();
    }
  }

  Future<BrandModel> loadBrandDetail({@required int id}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchBrandDetail(id: id);
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
