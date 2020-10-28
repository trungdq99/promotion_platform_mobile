// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class CustomerState extends BlocState {
  CustomerModel customerModel;
  bool isLoad;
  bool isLoading;
  bool isError;

  CustomerState({
    this.customerModel,
    this.isLoad: false,
    this.isLoading: false,
    this.isError: false,
  });
  factory CustomerState.loaded({@required CustomerModel customerModel}) {
    return CustomerState(
      isLoad: true,
      customerModel: customerModel,
    );
  }
  factory CustomerState.loading() {
    return CustomerState(
      isLoading: true,
    );
  }
  factory CustomerState.error() {
    return CustomerState(
      isError: true,
    );
  }
}
