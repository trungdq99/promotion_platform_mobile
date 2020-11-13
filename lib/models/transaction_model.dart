// Author: Trung Shin
// {
// "id": 1,
// "accountId": 1,
// "amount": 20,
// "currencyCode": null,
// "fcamount": null,
// "date": "2020-10-29T15:04:12.07",
// "notes": null,
// "isIncreaseTransaction": false,
// "status": null,
// "storeId": null,
// "brandId": 1,
// "userId": null,
// "transactionType": null,
// "transactionCode": null,
// "invoiceId": null,
// "account": null
// }
class TransactionModel {
  int id;
  int accountId;
  int amount;
  String currencyCode;
  double fcamount;
  String date;
  String notes;
  bool isIncreaseTransaction;
  int status;
  int storeId;
  int brandId;
  String userId;
  int transactionType;
  String transactionCode;
  String invoiceId;
  //account

  TransactionModel({
    this.id: 0,
    this.accountId: 0,
    this.amount: 0,
    this.currencyCode: '',
    this.fcamount: 0,
    this.date: '',
    this.notes: '',
    this.isIncreaseTransaction,
    this.status: 0,
    this.storeId: 0,
    this.brandId: 0,
    this.userId: '',
    this.transactionCode: '',
    this.transactionType: 0,
    this.invoiceId: '',
  });

  TransactionModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'] ?? 0;
    this.accountId = map['accountId'] ?? 0;
  }

  static Map<String, dynamic> toMap({int amount, int brandId}) => {
        'amount': amount ?? 0,
        'brandId': brandId ?? 0,
      };
}
