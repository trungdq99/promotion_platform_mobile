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
}
