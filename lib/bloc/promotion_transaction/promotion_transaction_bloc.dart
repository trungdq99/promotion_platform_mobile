// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/promotion_transaction/promotion_transaction_event.dart';
import 'package:promotion_platform/bloc/promotion_transaction/promotion_transaction_state.dart';
import 'package:promotion_platform/models/response_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class PromotionTransactionBloc extends BlocEventStateBase<
    PromotionTransactionEvent, PromotionTransactionState> {
  PromotionTransactionBloc() : super(initialState: PromotionTransactionState());

  @override
  Stream<PromotionTransactionState> eventHandler(
    PromotionTransactionEvent event,
    PromotionTransactionState currentState,
  ) async* {
    if (event is PromotionTransactionEventTransact) {
      yield PromotionTransactionState.transacting();
      ResponseModel responseModel;
      responseModel = await transactPromotion(
        token: event.token,
        voucherGroupId: event.voucherGroupId,
      );
      if (responseModel != null) {
        if (responseModel.isSuccess) {
          yield PromotionTransactionState.transacted(
              message: responseModel.message);
        } else {
          yield PromotionTransactionState.error(message: responseModel.message);
        }
      } else {
        yield PromotionTransactionState.error(message: 'Something went wrong!');
      }
      await Future.delayed(Duration(seconds: 4));
      yield PromotionTransactionState();
    }
  }

  Future<ResponseModel> transactPromotion({
    @required String token,
    @required int voucherGroupId,
  }) async {
    Repository _repository = Repository();
    Response response = await _repository.promotionTransaction(
      token: token,
      voucherGroupId: voucherGroupId,
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
