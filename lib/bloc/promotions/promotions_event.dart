// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class PromotionsEvent extends BlocEvent {
  final int categoryId;
  final int filterId;
  final int pageId;
  final String search;

  PromotionsEvent({
    @required this.pageId,
    @required this.categoryId,
    @required this.filterId,
    @required this.search,
  });
}

class PromotionsEventLoad extends PromotionsEvent {
  PromotionsEventLoad({
    @required int categoryId,
    @required int filterId,
    @required int pageId,
    @required String search,
  }) : super(
          categoryId: categoryId,
          filterId: filterId,
          pageId: pageId,
          search: search,
        );
}
