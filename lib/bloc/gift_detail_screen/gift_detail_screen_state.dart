import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class GiftDetailScreenState extends BlocState {
  final bool isOpen;
  GiftDetailScreenState({
    this.isOpen: false,
  });

  factory GiftDetailScreenState.open() {
    return GiftDetailScreenState(
      isOpen: true,
    );
  }

  factory GiftDetailScreenState.close() {
    return GiftDetailScreenState(
      isOpen: false,
    );
  }
}
