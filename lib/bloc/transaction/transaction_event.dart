// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:promotion_platform/models/transaction_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class TransactionEvent extends BlocEvent {
  final String token;
  final TransactionModel transactionModel;

  TransactionEvent({
    @required this.token,
    @required this.transactionModel,
  });
}

class TransactionEventMakeTransaction extends TransactionEvent {
  final String token;
  final TransactionModel transactionModel;
  TransactionEventMakeTransaction({
    @required this.token,
    @required this.transactionModel,
  }) : super(
          token: token,
          transactionModel: transactionModel,
        );
}
