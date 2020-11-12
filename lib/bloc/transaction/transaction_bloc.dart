// Author: Trung Shin
import 'package:promotion_platform/bloc/transaction/transaction_event.dart';
import 'package:promotion_platform/bloc/transaction/transaction_state.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class TransactionBloc
    extends BlocEventStateBase<TransactionEvent, TransactionState> {
  @override
  Stream<TransactionState> eventHandler(
      TransactionEvent event, TransactionState currentState) async* {
    if (event is TransactionEventMakeTransaction) {}
  }
}
