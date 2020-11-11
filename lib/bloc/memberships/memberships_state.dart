// Author: Trung Shin
import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/models/membership_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';

class MembershipsState extends BlocState {
  bool isLoad;
  bool isLoading;
  bool hasError;
  String errMsg;
  List<MembershipModel> listMembership;

  MembershipsState({
    this.isLoad: false,
    this.isLoading: false,
    this.hasError: false,
    this.errMsg: '',
    this.listMembership,
  });

  factory MembershipsState.loaded(
      {@required List<MembershipModel> listMembership}) {
    return MembershipsState(
      isLoad: true,
      listMembership: listMembership,
    );
  }

  factory MembershipsState.loading() {
    return MembershipsState(isLoading: true);
  }

  factory MembershipsState.error({@required String errMsg}) {
    return MembershipsState(
      hasError: true,
      errMsg: errMsg,
    );
  }
}
