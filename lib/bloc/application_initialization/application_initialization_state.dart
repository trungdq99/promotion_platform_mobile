import '../../utils/bloc_helpers/bloc_event_state.dart';

class ApplicationInitializationState extends BlocState {
  ApplicationInitializationState({
    this.isInitialized: false,
    this.isInitializing: false,
    this.percent: 0,
  });

  final bool isInitialized;
  final bool isInitializing;
  final double percent;
  factory ApplicationInitializationState.initializing({double percent}) {
    return ApplicationInitializationState(
      isInitializing: true,
      percent: percent,
    );
  }

  factory ApplicationInitializationState.initialized() {
    return ApplicationInitializationState(
      isInitialized: true,
      percent: 1,
    );
  }
}
