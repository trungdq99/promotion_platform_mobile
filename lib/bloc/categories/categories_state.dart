// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/category_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class CategoriesState extends BlocState {
  bool isLoaded;
  bool isLoading;
  bool hasError;
  String errMsg;
  List<CategoryModel> listCategoryModel;

  CategoriesState({
    this.isLoaded: false,
    this.isLoading: false,
    this.hasError: false,
    this.errMsg: '',
    this.listCategoryModel,
  });

  factory CategoriesState.loaded(
      {@required List<CategoryModel> listCategoryModel}) {
    return CategoriesState(
      isLoaded: true,
      listCategoryModel: listCategoryModel,
    );
  }

  factory CategoriesState.loading() {
    return CategoriesState(isLoading: true);
  }

  factory CategoriesState.error({@required String errMsg}) {
    return CategoriesState(
      hasError: true,
      errMsg: errMsg,
    );
  }
}
