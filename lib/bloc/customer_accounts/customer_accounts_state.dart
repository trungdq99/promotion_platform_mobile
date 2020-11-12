// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/models/customer_account_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class CustomerAccountsState extends BlocState {
  bool isLoad;
  bool isLoading;
  bool hasError;
  String errMsg;
  List<CustomerAccountModel> listCustomerAccount;

  CustomerAccountsState({
    this.isLoad: false,
    this.isLoading: false,
    this.errMsg: '',
    this.hasError: false,
    this.listCustomerAccount,
  });

  factory CustomerAccountsState.loaded(
      {@required List<CustomerAccountModel> listCustomerAccount}) {
    return CustomerAccountsState(
      isLoad: true,
      listCustomerAccount: listCustomerAccount,
    );
  }

  factory CustomerAccountsState.loading() {
    return CustomerAccountsState(
      isLoading: true,
    );
  }

  factory CustomerAccountsState.error({@required String errMsg}) {
    return CustomerAccountsState(
      hasError: true,
      errMsg: errMsg,
    );
  }
}
