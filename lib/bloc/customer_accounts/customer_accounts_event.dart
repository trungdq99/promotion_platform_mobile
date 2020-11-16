// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class CustomerAccountsEvent extends BlocEvent {
  final String token;
  final int membershipId;
  CustomerAccountsEvent({
    @required this.membershipId,
    @required this.token,
  });
}

class CustomerAccountsEventLoad extends CustomerAccountsEvent {
  CustomerAccountsEventLoad(
      {@required String token, @required int membershipId})
      : super(
          membershipId: membershipId,
          token: token,
        );
}
