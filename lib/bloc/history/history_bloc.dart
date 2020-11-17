// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/history/history_event.dart';
import 'package:promotion_platform/bloc/history/history_state.dart';
import 'package:promotion_platform/models/history_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class HistoryBloc extends BlocEventStateBase<HistoryEvent, HistoryState> {
  HistoryBloc() : super(initialState: HistoryState());

  @override
  Stream<HistoryState> eventHandler(
    HistoryEvent event,
    HistoryState currentState,
  ) async* {
    if (event is HistoryEventLoad) {
      yield HistoryState.loading();
      List<HistoryModel> listHistoryModel;
      listHistoryModel = await loadHistory(token: event.token);
      if (listHistoryModel != null) {
        yield HistoryState.loaded(listHistoryModel: listHistoryModel);
      } else {
        yield HistoryState.error(message: 'Something went wrong!');
      }
    }
  }

  Future<List<HistoryModel>> loadHistory({@required String token}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchHistory(token: token);
    print(response.statusCode);
    print(response.body);
    List<HistoryModel> listHistoryModel;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        listHistoryModel = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          HistoryModel historyModel = HistoryModel.fromMap(map);
          listHistoryModel.add(historyModel);
        });
      }
    }
    return listHistoryModel;
  }
}
