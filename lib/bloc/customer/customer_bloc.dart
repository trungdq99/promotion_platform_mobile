// Author: Trung Shin

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;
import 'package:promotion_platform/bloc/customer/customer_event.dart';
import 'package:promotion_platform/bloc/customer/customer_state.dart';
import 'package:promotion_platform/models/customer_model.dart';
import 'package:promotion_platform/models/response_model.dart';
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
        yield CustomerState.error(message: 'Something went wrong!');
      } else {
        yield CustomerState.loaded(customerModel: customerModel);
      }
    } else if (event is CustomerEventUpdate) {
      yield CustomerState.loading();
      ResponseModel responseModel;
      responseModel = await updateCustomer(
        token: event.token,
        customerModel: event.customerModel,
      );
      if (responseModel == null) {
        yield CustomerState.error(message: 'Something went wrong!');
      } else {
        // if (responseModel.isSuccess) {
        yield CustomerState.updated(message: responseModel.message);
        await Future.delayed(Duration(seconds: 4));
        yield CustomerState.loaded(customerModel: event.customerModel);
        // } else {
        //   yield CustomerState.error(message: responseModel.message);
        // }
      }
    } else if (event is CustomerEventLoadBalance) {
      double balance;
      balance = await loadBalance(token: event.token);
      if (balance != null) {
        CustomerModel customerModel = currentState.customerModel;
        customerModel.lastBalance = balance.toDouble();
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

  Future<ResponseModel> updateCustomer({
    @required String token,
    @required CustomerModel customerModel,
  }) async {
    Repository _repository = Repository();
    Response response = await _repository.updateCustomer(
      token: token,
      customerModel: customerModel,
    );
    print(response.statusCode);
    print(response.body);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = Helper.decodeJson(response.body);
      if (responseBody != null) {
        responseModel = ResponseModel.fromMap(responseBody);
      }
    }
    return responseModel;
  }

  Future<double> loadBalance({@required String token}) async {
    Repository _repository = Repository();
    Response response = await _repository.fetchBalance(token: token);
    print(response.statusCode);
    print(response.body);
    double balance;
    if (response.statusCode == 200) {
      balance = Helper.decodeJson(response.body);
    }
    return balance;
  }
}
