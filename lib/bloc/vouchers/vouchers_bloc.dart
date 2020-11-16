// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/vouchers/vouchers_event.dart';
import 'package:promotion_platform/bloc/vouchers/vouchers_state.dart';
import 'package:promotion_platform/models/voucher_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class VouchersBloc extends BlocEventStateBase<VouchersEvent, VouchersState> {
  VouchersBloc() : super(initialState: VouchersState());

  @override
  Stream<VouchersState> eventHandler(
    VouchersEvent event,
    VouchersState currentState,
  ) async* {
    if (event is VouchersEventLoad) {
      yield VouchersState.loading();
      List<VoucherModel> listVoucherModel;
      listVoucherModel = await loadVouchers(token: event.token);
      if (listVoucherModel == null) {
        yield VouchersState.error(message: 'Something went wrong!');
      } else {
        yield VouchersState.loaded(listVoucherModel: listVoucherModel);
      }
    }
  }

  Future<List<VoucherModel>> loadVouchers({@required String token}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchVouchers(token: token);
    print(response.statusCode);
    print(response.body);
    List<VoucherModel> listVoucherModel;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        listVoucherModel = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          VoucherModel voucherModel = VoucherModel.fromMap(map);
          listVoucherModel.add(voucherModel);
        });
      }
    }
    return listVoucherModel;
  }
}
