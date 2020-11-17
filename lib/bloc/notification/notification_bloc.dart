// Author: Trung Shin

import 'package:promotion_platform/bloc/notification/notification_event.dart';
import 'package:promotion_platform/bloc/notification/notification_state.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class NotificationBloc
    extends BlocEventStateBase<NotificationEvent, NotificationState> {
  NotificationBloc() : super(initialState: NotificationState());

  @override
  Stream<NotificationState> eventHandler(
    NotificationEvent event,
    NotificationState currentState,
  ) async* {
    if (event is NotificationEventGetMessage) {
      yield NotificationState.hasMessage(message: event.message);
      await Future.delayed(Duration(seconds: 4));
      yield NotificationState();
    }
  }
}
