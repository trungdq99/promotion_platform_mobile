// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class CustomerAccountsEvent extends BlocEvent {
  final int membershipId;
  CustomerAccountsEvent({@required this.membershipId});
}

class CustomerAccountsEventLoad extends CustomerAccountsEvent {
  CustomerAccountsEventLoad({@required int membershipId})
      : super(membershipId: membershipId);
}
