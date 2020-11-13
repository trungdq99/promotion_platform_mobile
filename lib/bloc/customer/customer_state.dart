// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class CustomerState extends BlocState {
  CustomerModel customerModel;
  bool isLoaded;
  bool isLoading;
  bool isError;
  bool isUpdated;
  String message;

  CustomerState({
    this.customerModel,
    this.isLoaded: false,
    this.isLoading: false,
    this.isError: false,
    this.isUpdated: false,
    this.message: '',
  });

  factory CustomerState.loaded({@required CustomerModel customerModel}) {
    return CustomerState(
      isLoaded: true,
      customerModel: customerModel,
    );
  }

  factory CustomerState.loading() {
    return CustomerState(
      isLoading: true,
    );
  }

  factory CustomerState.error({@required String message}) {
    return CustomerState(
      isError: true,
      message: message,
    );
  }

  factory CustomerState.updated({
    @required String message,
  }) {
    return CustomerState(
      isUpdated: true,
      message: message,
    );
  }
}
