// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/repository/repository.dart';
import 'package:promotion_platform/utils/bloc_helpers/bloc_event_state.dart';
import 'package:promotion_platform/utils/helper.dart';

class CustomerBloc extends BlocEventStateBase<CustomerEvent, CustomerState> {
  CustomerBloc() : super(initialState: CustomerState());
  @override
  Stream<CustomerState> eventHandler(
      CustomerEvent event, CustomerState currentState) async* {
    if (event is CustomerEventLoad) {
      yield CustomerState.loading();
      CustomerModel customerModel;
      customerModel = await loadCustomer(token: event.token);
      if (customerModel == null) {
        yield CustomerState.error();
      } else {
        yield CustomerState.loaded(customerModel: customerModel);
      }
    }
  }

  Future<CustomerModel> loadCustomer({@required String token}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchCustomer(token: token);
    print(response.statusCode);
    print(response.body);
    CustomerModel customerModel;
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);

      if (responseBody != null) {
        customerModel = CustomerModel.fromMap(responseBody);
        return customerModel;
      }
    }
    return customerModel;
  }
}
