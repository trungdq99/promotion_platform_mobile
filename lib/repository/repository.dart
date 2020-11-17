import 'package:flutter/foundation.dart';
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

  Future fetchBalance({@required String token}) => _apiProvider.fetchData(
        BALANCE_API,
        RequestMethod.GET,
        Helper.getAuthorizeHeader(token),
        '',
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

  Future fetchPromotions({
    @required int categoryId,
    @required int filterId,
    @required int pageId,
    @required String search,
  }) =>
      _apiProvider.fetchData(
        '$PROMOTIONS_API/category/$categoryId/filter/$filterId/page/$pageId/search/$search',
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future fetchPromotionDetail({@required int id}) => _apiProvider.fetchData(
        '$PROMOTION_DETAIL_API/$id',
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
        '$BRANDS_API/$brandId',
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        '',
      );

  Future collectPoint({
    @required String token,
    @required String qrCode,
  }) {
    Map<String, dynamic> body = {'qrCode': qrCode};
    return _apiProvider.fetchData(
      POINT_COLLECTION_API,
      RequestMethod.POST,
      Helper.getAuthorizeHeader(token),
      Helper.encodeJson(body),
    );
  }

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
    @required String token,
    @required int membershipId,
  }) =>
      _apiProvider.fetchData(
        '$CUSTOMER_ACCOUNTS_API/$membershipId',
        RequestMethod.GET,
        Helper.getAuthorizeHeader(token),
        '',
      );

  Future promotionTransaction({
    @required String token,
    @required int voucherGroupId,
  }) =>
      _apiProvider.fetchData(
        '$PROMOTION_TRANSACTION_API/$voucherGroupId',
        RequestMethod.PUT,
        Helper.getAuthorizeHeader(token),
        '',
      );

  Future fetchVouchers({
    @required String token,
  }) =>
      _apiProvider.fetchData(
        VOUCHERS_API,
        RequestMethod.GET,
        Helper.getAuthorizeHeader(token),
        '',
      );

  Future updateVoucher(
      {@required int id, @required String token, @required bool isUsed}) {
    Map<String, dynamic> body = {
      'id': id,
      'isUsed': isUsed,
    };
    return _apiProvider.fetchData(VOUCHER_PREPARATION, RequestMethod.PUT,
        Helper.getAuthorizeHeader(token), Helper.encodeJson(body));
  }

  Future fetchHistory({
    @required String token,
  }) =>
      _apiProvider.fetchData(
        HISTORY_API,
        RequestMethod.GET,
        Helper.getAuthorizeHeader(token),
        '',
      );
}
