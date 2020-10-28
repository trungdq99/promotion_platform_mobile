import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class PromotionDetailScreenEvent extends BlocEvent {

}

class PromotionDetailScreenEventOpen extends PromotionDetailScreenEvent {}

class PromotionDetailScreenEventClose extends PromotionDetailScreenEvent {}
