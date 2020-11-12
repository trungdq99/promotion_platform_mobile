// Author: Trung Shin

// "accountId": 15,
// "accountCode": null,
// "accountName": null,
// "level": null,
// "startDate": null,
// "finishDate": null,
// "balance": 450,
// "productCode": null,
// "membershipCardId": 24,
// "type": null,
// "brandId": 26,
// "active": true,
// "membershipCard": null,
// "transaction": []
class CustomerAccountModel {
  int accountId;
  String accountCode;
  String accountName;
  int level;
  String startDate;
  String finishDate;
  double balance;
  String productCode;
  int membershipCardId;
  int type;
  int brandId;
  bool active;

  CustomerAccountModel({
    this.accountId,
    this.accountCode: '',
    this.accountName: '',
    this.level: 0,
    this.startDate: '',
    this.finishDate: '',
    this.balance: 0,
    this.productCode: '',
    this.membershipCardId: 0,
    this.type: 0,
    this.brandId: 0,
    this.active: false,
  });

  CustomerAccountModel.fromMap(Map<String, dynamic> map) {
    this.accountId = map['accountId'];
    this.accountCode = map['accountCode'] ?? '';
    this.accountName = map['accountName'] ?? '';
    this.level = map['level'] ?? 0;
    this.startDate = map['startDate'] ?? '';
    this.finishDate = map['finishDate'] ?? '';
    this.balance = map['balance'] ?? 0;
    this.productCode = map['productCode'] ?? '';
    this.membershipCardId = map['membershipCardId'] ?? 0;
    this.type = map['type'] ?? 0;
    this.brandId = map['brandId'] ?? 0;
    this.active = map['active'] ?? false;
  }
}
