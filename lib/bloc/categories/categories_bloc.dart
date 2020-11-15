// Author: Trung Shin

import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/categories/categories_event.dart';
import 'package:promotion_platform/bloc/categories/categories_state.dart';
import 'package:promotion_platform/models/category_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class CategoriesBloc
    extends BlocEventStateBase<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(initialState: CategoriesState());

  @override
  Stream<CategoriesState> eventHandler(
    CategoriesEvent event,
    CategoriesState currentState,
  ) async* {
    if (event is CategoriesEventLoad) {
      yield CategoriesState.loading();
      List<CategoryModel> listCategoryModel;
      listCategoryModel = await loadCategories();
      if (listCategoryModel != null) {
        yield CategoriesState.loaded(listCategoryModel: listCategoryModel);
      } else {
        yield CategoriesState.error(errMsg: 'Something went wrong!');
      }
    }
  }

  Future<List<CategoryModel>> loadCategories() async {
    Repository _repository = Repository();
    Response response = await _repository.fetchTopBrands();
    print(response.statusCode);
    print(response.body);
    List<CategoryModel> listCategoryModel;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        listCategoryModel = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          CategoryModel categoryModel = CategoryModel.fromMap(map);
          listCategoryModel.add(categoryModel);
        });
      }
    }
    return listCategoryModel;
  }
}
