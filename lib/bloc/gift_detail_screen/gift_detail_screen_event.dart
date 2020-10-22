import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class GiftDetailScreenEvent extends BlocEvent {}

class GiftDetailScreenEventOpen extends GiftDetailScreenEvent {}

class GiftDetailScreenEventClose extends GiftDetailScreenEvent {}
