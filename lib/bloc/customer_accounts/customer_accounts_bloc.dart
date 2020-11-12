// Author: Trung Shin

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/customer_accounts/customer_accounts_event.dart';
import 'package:promotion_platform/bloc/customer_accounts/customer_accounts_state.dart';
import 'package:promotion_platform/models/customer_account_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class CustomerAccountsBloc
    extends BlocEventStateBase<CustomerAccountsEvent, CustomerAccountsState> {
  CustomerAccountsBloc() : super(initialState: CustomerAccountsState());
  @override
  Stream<CustomerAccountsState> eventHandler(
      CustomerAccountsEvent event, CustomerAccountsState currentState) async* {
    if (event is CustomerAccountsEventLoad) {
      yield CustomerAccountsState.loading();
      List<CustomerAccountModel> listCustomerAccount;
      listCustomerAccount =
          await loadCustomerAccounts(membershipId: event.membershipId);
      if (listCustomerAccount == null) {
        yield CustomerAccountsState.error(
          errMsg: 'Something went wrong!!!',
        );
      } else {
        yield CustomerAccountsState.loaded(
          listCustomerAccount: listCustomerAccount,
        );
      }
    }
  }

  Future<List<CustomerAccountModel>> loadCustomerAccounts(
      {@required int membershipId}) async {
    Repository _repository = Repository();
    Response response =
        await _repository.fetchCustomerAccounts(membershipId: membershipId);
    print(response.statusCode);
    print(response.body);
    List<CustomerAccountModel> listCustomerAccount;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);
      if (responseBody != null) {
        listCustomerAccount = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          listCustomerAccount.add(CustomerAccountModel.fromMap(map));
        });
      }
    }
    return listCustomerAccount;
  }
}
