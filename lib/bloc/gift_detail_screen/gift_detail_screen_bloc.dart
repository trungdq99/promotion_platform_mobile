import './gift_detail_screen_event.dart';
import './gift_detail_screen_state.dart';
import '../../utils/bloc_helpers/bloc_event_state.dart';

class GiftDetailScreenBloc
    extends BlocEventStateBase<GiftDetailScreenEvent, GiftDetailScreenState> {
  GiftDetailScreenBloc()
      : super(
          initialState: GiftDetailScreenState(),
        );

  @override
  Stream<GiftDetailScreenState> eventHandler(
      GiftDetailScreenEvent event, GiftDetailScreenState state) async* {
    if (event is GiftDetailScreenEventOpen) {
      yield GiftDetailScreenState.open();
    } else if (event is GiftDetailScreenEventClose) {
      yield GiftDetailScreenState.close();
    }
  }
}
