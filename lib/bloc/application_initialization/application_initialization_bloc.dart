import '../../utils/bloc_helpers/bloc_event_state.dart';
import './application_initialization_event.dart';
import './application_initialization_state.dart';

class ApplicationInitializationBloc extends BlocEventStateBase<
    ApplicationInitializationEvent, ApplicationInitializationState> {
  ApplicationInitializationBloc()
      : super(
          initialState: ApplicationInitializationState(),
        );

  @override
  Stream<ApplicationInitializationState> eventHandler(
      ApplicationInitializationEvent event,
      ApplicationInitializationState state) async* {
    if (event.applicationInitializationEventType ==
        ApplicationInitializationEventType.initialized) {
      await Future.delayed(Duration(milliseconds: 1000));
      double percent = 0;
      while (percent <= 1) {
        yield ApplicationInitializationState.initializing(percent: percent);
        if (percent <= 0.5)
          await Future.delayed(Duration(milliseconds: 300));
        else
          await Future.delayed(Duration(milliseconds: 100));
        percent += 0.1;
      }
      yield ApplicationInitializationState.initialized();
    }
  }
}
