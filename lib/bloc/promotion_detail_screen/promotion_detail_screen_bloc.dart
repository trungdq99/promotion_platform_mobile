import './promotion_detail_screen_event.dart';
import './promotion_detail_screen_state.dart';
import '../../utils/bloc_helpers/bloc_event_state.dart';

class PromotionDetailScreenBloc extends BlocEventStateBase<
    PromotionDetailScreenEvent, PromotionDetailScreenState> {
  PromotionDetailScreenBloc()
      : super(
          initialState: PromotionDetailScreenState(),
        );

  @override
  Stream<PromotionDetailScreenState> eventHandler(
      PromotionDetailScreenEvent event,
      PromotionDetailScreenState state) async* {
    if (event is PromotionDetailScreenEventOpen) {
      yield PromotionDetailScreenState.open();
    } else if (event is PromotionDetailScreenEventClose) {
      yield PromotionDetailScreenState.close();
    }
  }
}
