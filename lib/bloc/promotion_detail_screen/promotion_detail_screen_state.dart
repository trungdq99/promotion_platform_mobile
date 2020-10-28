import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionDetailScreenState extends BlocState {
  final bool isOpen;
  PromotionDetailScreenState({
    this.isOpen: false,
  });

  factory PromotionDetailScreenState.open() {
    return PromotionDetailScreenState(
      isOpen: true,
    );
  }

  factory PromotionDetailScreenState.close() {
    return PromotionDetailScreenState(
      isOpen: false,
    );
  }
}
