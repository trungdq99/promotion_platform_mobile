// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:promotion_platform/models/history_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class HistoryState extends BlocState {
  bool isLoaded;
  bool isLoading;
  bool isError;
  String message;
  List<HistoryModel> listHistoryModel;
  HistoryState({
    this.message: '',
    this.isError: false,
    this.isLoaded: false,
    this.isLoading: false,
    this.listHistoryModel,
  });

  factory HistoryState.loaded({@required List<HistoryModel> listHistoryModel}) {
    return HistoryState(
      isLoaded: true,
      listHistoryModel: listHistoryModel,
    );
  }

  factory HistoryState.loading() {
    return HistoryState(
      isLoading: true,
    );
  }

  factory HistoryState.error({@required String message}) {
    return HistoryState(
      isError: true,
      message: message,
    );
  }
}
