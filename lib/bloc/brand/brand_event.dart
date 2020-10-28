// Author: Trung Shin

import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

abstract class BrandEvent extends BlocEvent {}

class BrandEventLoadList extends BrandEvent {}
