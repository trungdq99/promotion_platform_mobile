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
        null,
      );
  Future fetchBrands() => _apiProvider.fetchData(
        BRANDS_API,
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        null,
      );

  Future fetchBrandDetail({@required int id}) => _apiProvider.fetchData(
        '$BRANDS_API/$id',
        RequestMethod.GET,
        UN_AUTHORIZE_HEADER,
        null,
      );
}