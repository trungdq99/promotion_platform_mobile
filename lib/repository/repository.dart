import 'package:flutter/cupertino.dart';
import '../utils/helper.dart';

import '../utils/constant.dart';
import './api_provider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();
  Future login({@required String token}) {
    Map<String, dynamic> body = {
      'uidToken': token,
    };
    return _apiProvider.fetchData(
      LOGIN_API,
      RequestMethod.POST,
      UN_AUTHORIZE_HEADER,
      Helper.encodeJson(body),
    );
  }

  Future fetchCustomer({@required String token}) => _apiProvider.fetchData(
        CUSTOMER_API,
        RequestMethod.GET,
        Helper.getAuthorizeHeader(token),
        '',
      );
  Future fetchBrands() => _apiProvider.fetchData(
        BRANDS_API,
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future fetchBrandDetail({@required int brandId}) => _apiProvider.fetchData(
        '$BRANDS_API/$brandId',
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future makeTransactions({
    @required String token,
    @required String body,
  }) =>
      _apiProvider.fetchData(
        TRANSACTION_API,
        RequestMethod.POST,
        Helper.getAuthorizeHeader(token),
        body,
      );

  Future fetchMemberships({
    @required String token,
  }) =>
      _apiProvider.fetchData(
        MEMBERSHIPS_API,
        RequestMethod.GET,
        Helper.getAuthorizeHeader(token),
        '',
      );
}
