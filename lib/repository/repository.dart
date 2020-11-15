import 'package:flutter/cupertino.dart';
import 'package:promotion_platform/models/customer_model.dart';
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

  Future updateCustomer({
    @required String token,
    @required CustomerModel customerModel,
  }) =>
      _apiProvider.fetchData(
        CUSTOMER_API,
        RequestMethod.PUT,
        Helper.getAuthorizeHeader(token),
        Helper.encodeJson(
          customerModel.getUpdateParam(),
        ),
      );

  Future fetchCategories() => _apiProvider.fetchData(
        CATEGORIES_API,
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future fetchTopPromotions() => _apiProvider.fetchData(
        TOP_PROMOTIONS_API,
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future fetchTopBrands() => _apiProvider.fetchData(
        TOP_BRANDS_API,
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future fetchBrandDetail({@required int brandId}) => _apiProvider.fetchData(
        '$TOP_BRANDS_API/$brandId',
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

  Future fetchCustomerAccounts({
    @required int membershipId,
  }) =>
      _apiProvider.fetchData(
        '$CUSTOMER_ACCOUNTS_API=$membershipId',
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );
}
