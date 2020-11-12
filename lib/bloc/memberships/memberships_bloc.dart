// Author: Trung Shin

import 'package:http/http.dart' show Response;
import 'package:flutter/widgets.dart';
import 'package:promotion_platform/bloc/memberships/memberships_event.dart';
import 'package:promotion_platform/bloc/memberships/memberships_state.dart';
import 'package:promotion_platform/models/membership_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class MembershipsBloc
    extends BlocEventStateBase<MembershipsEvent, MembershipsState> {
  MembershipsBloc() : super(initialState: MembershipsState());
  @override
  Stream<MembershipsState> eventHandler(
      MembershipsEvent event, MembershipsState currentState) async* {
    if (event is MembershipsEventLoad) {
      yield MembershipsState.loading();
      List<MembershipModel> listMembership;
      listMembership = await loadMemberships(token: event.token);
      if (listMembership == null) {
        yield MembershipsState.error(
          errMsg: 'Something went wrong!!!',
        );
      } else {
        yield MembershipsState.loaded(
          listMembership: listMembership,
        );
      }
    }
  }

  Future<List<MembershipModel>> loadMemberships(
      {@required String token}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchMemberships(token: token);
    print(response.statusCode);
    print(response.body);
    List<MembershipModel> listMembership;
    if (response.statusCode == 200) {
      List<dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        listMembership = [];
        responseBody.forEach((element) {
          Map<String, dynamic> map = element;
          listMembership.add(MembershipModel.fromMap(map));
        });
      }
    }
    return listMembership;
  }
}
