// Author: Trung Shin
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/point_collection/point_collection_bloc.dart';
import 'package:promotion_platform/bloc/point_collection/point_collection_event.dart';
import 'package:promotion_platform/bloc/point_collection/point_collection_state.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';
import 'package:promotion_platform/utils/custom_widget/custom_alert.dart';
import 'package:promotion_platform/utils/custom_widget/full_screen_progressing.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanTab extends StatefulWidget {
  final CupertinoTabController tabController;
  QrCodeScanTab({@required this.tabController});
  @override
  _QrCodeScanTabState createState() => _QrCodeScanTabState();
}

class _QrCodeScanTabState extends State<QrCodeScanTab> {
  String data = '';
  QRViewController _qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    this._qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        isScanning = false;
        _qrViewController.pauseCamera();
      });
      if (_token.isNotEmpty) {
        _pointCollectionBloc.emitEvent(PointCollectionEventCollect(
          token: _token,
          qrCode: scanData,
        ));
      }
    });
  }

  bool isScanning;

  PointCollectionBloc _pointCollectionBloc;
  @override
  void initState() {
    isScanning = true;
    _pointCollectionBloc = PointCollectionBloc();
    super.initState();
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  AuthenticationBloc _authenticationBloc;
  CustomerBloc _customerBloc;

  String _token = '';

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: BlocEventStateBuilder<PointCollectionState>(
            bloc: _pointCollectionBloc,
            builder: (context, pointCollectionState) {
              if (pointCollectionState.isCollected && _token.isNotEmpty) {
                _customerBloc
                    .emitEvent(CustomerEventLoadBalance(token: _token));
              }
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocEventStateBuilder<AuthenticationState>(
                          builder: (context, authenticationState) {
                            if (authenticationState.isAuthenticated) {
                              _token = authenticationState.token;
                            }
                            return Neumorphic(
                              style: neumorphicStyleDownDefault,
                              child: Container(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height / 2,
                                color: CustomColors.BACKGROUND_COLOR,
                                alignment: Alignment.center,
                                child: isScanning
                                    ? QRView(
                                        key: qrKey,
                                        onQRViewCreated: _onQRViewCreated,
                                      )
                                    : Text(
                                        'Camera is close!',
                                        style: DEFAULT_TEXT_STYLE,
                                      ),
                              ),
                            );
                          },
                          bloc: _authenticationBloc,
                        ),
                        // Text(qrText),
                        NeumorphicButton(
                          style: neumorphicStyleUpWithHighRadius,
                          margin: EdgeInsets.symmetric(vertical: 32),
                          onPressed: () {
                            if (isScanning) {
                              _qrViewController.pauseCamera();
                              setState(() {
                                isScanning = false;
                              });
                            } else {
                              _qrViewController.resumeCamera();
                              setState(() {
                                isScanning = true;
                              });
                            }
                          },
                          child: Text(
                            isScanning ? 'Pause' : 'Resume',
                            style: DEFAULT_TEXT_STYLE,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pointCollectionState.isCollecting
                      ? FullScreenProgressing()
                      : SizedBox(),
                  pointCollectionState.isCollected
                      ? CustomAlert(errMsg: pointCollectionState.message)
                      : SizedBox(),
                  pointCollectionState.isError
                      ? CustomAlert(errMsg: pointCollectionState.message)
                      : SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
