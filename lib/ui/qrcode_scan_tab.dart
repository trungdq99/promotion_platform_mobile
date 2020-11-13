// Author: Trung Shin
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:promotion_platform/bloc/authentication/authentication_bloc.dart';
import 'package:promotion_platform/bloc/authentication/authentication_state.dart';
import 'package:promotion_platform/bloc/customer/customer_bloc.dart';
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_provider.dart';
import 'package:promotion_platform/utils/bloc_widgets/bloc_state_builder.dart';
import 'package:promotion_platform/utils/constant.dart';
import 'package:promotion_platform/utils/custom_colors.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanTab extends StatefulWidget {
  final CupertinoTabController tabController;
  QrCodeScanTab({@required this.tabController});
  @override
  _QrCodeScanTabState createState() => _QrCodeScanTabState();
}

class _QrCodeScanTabState extends State<QrCodeScanTab> {
  // final TextEditingController _amountController = TextEditingController();
  // final TextEditingController _storeIdController = TextEditingController();
  // final TextEditingController _amountController = TextEditingController();
  String data = '';
  QRViewController controller;
  var qrText = '';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // setState(() {
      //   qrText = scanData;
      // });
      if (_token.isNotEmpty) {
        // Repository repo = Repository();
        // await repo.makeTransactions(token: token, body: qrText);
        _customerBloc.emitEvent(CustomerEventLoad(token: _token));
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocEventStateBuilder<AuthenticationState>(
                  builder: (context, state) {
                    if (state.isAuthenticated) {
                      _token = state.token;
                    }
                    return Container(
                      height: 300,
                      width: double.maxFinite,
                      color: Colors.black,
                      // child: Text('Camera'),
                      // child: QRView(
                      //   key: qrKey,
                      //   onQRViewCreated: _onQRViewCreated,
                      // ),
                      // alignment: Alignment.center,
                      // child: Text('Camera'),
                    );
                    // return NeumorphicButton(
                    //   onPressed: () async {
                    //     if (token != null) {
                    //       Repository repo = Repository();
                    //       await repo.makeTransactions(
                    //           token: token, body: qrText);
                    //       _customerBloc
                    //           .emitEvent(CustomerEventLoad(token: token));
                    //       print('Success!');
                    //       showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Neumorphic(
                    //                 child: Container(
                    //                   width:
                    //                       MediaQuery.of(context).size.width / 2,
                    //                   height: 100,
                    //                   alignment: Alignment.center,
                    //                   child: Text(
                    //                     'Success!',
                    //                     style: DEFAULT_TEXT_STYLE,
                    //                   ),
                    //                 ),
                    //                 style: neumorphicStyleDownDefault,
                    //               ),
                    //               NeumorphicButton(
                    //                 style: neumorphicStyleUpDefault,
                    //                 padding: EdgeInsets.all(0),
                    //                 onPressed: () {
                    //                   Navigator.of(context).pop();
                    //                   widget.tabController.index = 0;
                    //                 },
                    //                 child: Container(
                    //                   width:
                    //                       MediaQuery.of(context).size.width / 2,
                    //                   alignment: Alignment.center,
                    //                   padding: EdgeInsets.all(16),
                    //                   color: CustomColors.GREEN,
                    //                   child: Text(
                    //                     'OK',
                    //                     style: DEFAULT_TEXT_STYLE,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     }
                    //   },
                    //   style: neumorphicStyleUpWithHighRadius,
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: 64,
                    //     vertical: 32,
                    //   ),
                    //   padding: EdgeInsets.all(0),
                    //   child: Container(
                    //     // height: 100,
                    //     width: double.maxFinite,
                    //     padding: EdgeInsets.all(16),
                    //     color: CustomColors.GREEN,
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       'Tích điểm',
                    //       style: DEFAULT_TEXT_STYLE,
                    //     ),
                    //   ),
                    // );
                  },
                  bloc: _authenticationBloc,
                ),
                // _buildQrCode(
                //   data: data,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // String _getQrCode({
  //   @required String amount,
  //   @required String storeId,
  // }) =>
  //     '$amount/$storeId';
  // Widget _buildQrCode({
  //   @required String data,
  //   double size: 240,
  // }) {
  //   return Column(
  //     children: [
  //       Text(data),
  //       QrImage(
  //         data: data,
  //         version: QrVersions.auto,
  //         size: size,
  //         gapless: false,
  //       ),
  //     ],
  //   );
  // }
}
