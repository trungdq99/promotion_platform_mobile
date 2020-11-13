// Author: Trung Shin

class ResponseModel {
  bool isSuccess;
  String message;

  ResponseModel({this.isSuccess: false, this.message: ''});

  ResponseModel.fromMap(Map<String, dynamic> map) {
    this.isSuccess = map['isSuccess'] ?? false;
    this.message = map['message'] ?? '';
  }
}
