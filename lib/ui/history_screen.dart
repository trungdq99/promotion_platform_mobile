// Author: Trung Shin

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/history/history_bloc.dart';
import 'package:promotion_platform/bloc/history/history_event.dart';
import 'package:promotion_platform/bloc/history/history_state.dart';
import 'package:promotion_platform/models/history_model.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';
import 'package:promotion_platform/utils/custom_widget/point.dart';
import 'package:promotion_platform/utils/helper.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryBloc _historyBloc;

  @override
  void initState() {
    _historyBloc = HistoryBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _token;
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    if (_authenticationBloc.lastState.isAuthenticated) {
      _token = _authenticationBloc.lastState.token;
    }
    if (_token != null && _token.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _historyBloc.emitEvent(HistoryEventLoad(token: _token));
      });
    }
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocEventStateBuilder<HistoryState>(
        bloc: _historyBloc,
        builder: (context, state) {
          List<HistoryModel> listHistoryModel;
          if (state.isLoaded) {
            listHistoryModel = state.listHistoryModel;
          }
          return Stack(
            children: [
              listHistoryModel != null && listHistoryModel.length > 0
                  ? _buildBody(listHistoryModel: listHistoryModel)
                  : Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Empty history',
                        style: DEFAULT_TEXT_STYLE,
                      ),
                    ),
              state.isLoading ? FullScreenProgressing() : SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return NeumorphicAppBar(
      leading: NeumorphicButton(
        style: neumorphicStyleUpCircle,
        onPressed: () async {
          await Helper.navigationDelay();
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(0),
        child: Icon(
          Icons.arrow_back_ios,
          color: CustomColors.TEXT_COLOR,
          size: BIG_FONT_SIZE,
        ),
      ),
      title: Text(
        'Lịch sử Bean',
        style: HEADER_TEXT_STYLE,
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody({@required List<HistoryModel> listHistoryModel}) {
    List<Widget> children = [];
    listHistoryModel.forEach((element) {
      children.add(_buildHistory(
        title: element.notes,
        amount: element.amount,
        date: element.date,
        transactionType: element.transactionType,
      ));
    });
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildHistory({
    String title: '',
    String date: '',
    double amount: 0,
    int transactionType: 0,
  }) {
    return Neumorphic(
      style: neumorphicStyleUpWithSmallRadius,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            Text(
              title,
              style: BOLD_TITLE_TEXT_STYLE,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Helper.convertDateToString(
                      Helper.convertStringToDateTimeVer2(date)),
                  style: SMALL_TEXT_STYLE,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Point(point: amount.toInt()),
                    transactionType != 0
                        ? Icon(
                            transactionType == 1
                                ? Icons.trending_up
                                : Icons.trending_down,
                            color: transactionType == 1
                                ? CustomColors.GREEN
                                : Colors.red,
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ],
        ),
        // child: ListTile(
        //   contentPadding: EdgeInsets.all(16),
        //   title: Text(
        //     title,
        //     style: BOLD_TITLE_TEXT_STYLE,
        //   ),
        //   subtitle: Text(
        //     date,
        //     style: SMALL_TEXT_STYLE,
        //   ),
        //   trailing: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Point(point: amount.toInt()),
        //       transactionType != 0
        //           ? Icon(
        //               transactionType == 1
        //                   ? Icons.trending_up
        //                   : Icons.trending_down,
        //               color: transactionType == 1
        //                   ? CustomColors.GREEN
        //                   : Colors.red,
        //             )
        //           : SizedBox(),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
