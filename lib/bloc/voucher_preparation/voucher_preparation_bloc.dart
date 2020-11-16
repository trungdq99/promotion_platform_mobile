// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/voucher_preparation/voucher_preparation_event.dart';
import 'package:promotion_platform/bloc/voucher_preparation/voucher_preparation_state.dart';
import 'package:promotion_platform/models/response_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class VoucherPreparationBloc extends BlocEventStateBase<VoucherPreparationEvent,
    VoucherPreparationState> {
  VoucherPreparationBloc() : super(initialState: VoucherPreparationState());

  @override
  Stream<VoucherPreparationState> eventHandler(
    VoucherPreparationEvent event,
    VoucherPreparationState currentState,
  ) async* {
    if (event is VoucherPreparationEventUse) {
      yield VoucherPreparationState.updating();
      ResponseModel responseModel;
      responseModel = await updateCustomer(
        token: event.token,
        id: event.id,
        isUsed: true,
      );
      if (responseModel == null) {
        yield VoucherPreparationState.error(message: 'Something went wrong!');
      } else {
        if (responseModel.isSuccess) {
          yield VoucherPreparationState.updated(message: responseModel.message);
        } else {
          yield VoucherPreparationState.error(message: responseModel.message);
        }
      }
      await Future.delayed(Duration(seconds: 4));
      yield VoucherPreparationState();
    } else if (event is VoucherPreparationEventCancel) {
      yield VoucherPreparationState.updating();
      ResponseModel responseModel;
      responseModel = await updateCustomer(
        token: event.token,
        id: event.id,
        isUsed: false,
      );
      if (responseModel == null) {
        yield VoucherPreparationState.error(message: 'Something went wrong!');
      } else {
        if (responseModel.isSuccess) {
          yield VoucherPreparationState.updated(message: responseModel.message);
        } else {
          yield VoucherPreparationState.error(message: responseModel.message);
        }
      }
      await Future.delayed(Duration(seconds: 4));
      yield VoucherPreparationState();
    }
  }

  Future<ResponseModel> updateCustomer({
    @required String token,
    @required int id,
    @required bool isUsed,
  }) async {
    Repository _repository = Repository();
    Response response = await _repository.updateVoucher(
      id: id,
      token: token,
      isUsed: isUsed,
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
