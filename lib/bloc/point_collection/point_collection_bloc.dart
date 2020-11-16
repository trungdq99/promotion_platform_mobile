// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/point_collection/point_collection_event.dart';
import 'package:promotion_platform/bloc/point_collection/point_collection_state.dart';
import 'package:promotion_platform/models/response_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class PointCollectionBloc
    extends BlocEventStateBase<PointCollectionEvent, PointCollectionState> {
  PointCollectionBloc() : super(initialState: PointCollectionState());

  @override
  Stream<PointCollectionState> eventHandler(
    PointCollectionEvent event,
    PointCollectionState currentState,
  ) async* {
    if (event is PointCollectionEventCollect) {
      yield PointCollectionState.collecting();
      ResponseModel responseModel;
      responseModel = await collectPoint(
        token: event.token,
        qrCode: event.qrCode,
      );
      if (responseModel != null) {
        if (responseModel.isSuccess) {
          yield PointCollectionState.collected(message: responseModel.message);
        } else {
          yield PointCollectionState.error(message: responseModel.message);
        }
      } else {
        yield PointCollectionState.error(message: 'Something went wrong!');
      }
      await Future.delayed(Duration(seconds: 4));
      yield PointCollectionState();
    }
  }

  Future<ResponseModel> collectPoint({
    @required String token,
    @required String qrCode,
  }) async {
    Repository _repository = Repository();
    Response response = await _repository.collectPoint(
      token: token,
      qrCode: qrCode,
    );
    print(response.statusCode);
    print(response.body);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        responseModel = ResponseModel.fromMap(responseBody);
      }
    }
    return responseModel;
  }
}
