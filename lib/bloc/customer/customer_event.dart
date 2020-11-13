// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class CustomerEvent extends BlocEvent {
  final String token;
  final CustomerModel customerModel;
  CustomerEvent({
    @required this.token,
    this.customerModel,
  });
}

class CustomerEventLoad extends CustomerEvent {
  CustomerEventLoad({@required String token}) : super(token: token);
}

class CustomerEventUpdate extends CustomerEvent {
  CustomerEventUpdate({
    @required String token,
    @required CustomerModel customerModel,
  }) : super(
          token: token,
          customerModel: customerModel,
        );
}
