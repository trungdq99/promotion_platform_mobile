// Author: Trung Shin

// {
// "id": 20,
// "name": "Trung Đỗ Quốc",
// "address": null,
// "phone": null,
// "fax": null,
// "contactPerson": null,
// "contactPersonNumber": null,
// "website": null,
// "email": "trung.do@uni-incubator.com",
// "type": null,
// "accountId": null,
// "idcard": null,
// "gender": null,
// "birthDay": "2020-10-22T00:00:00",
// "storeRegisterId": null,
// "district": null,
// "city": null,
// "customerCode": null,
// "customerTypeId": null,
// "brandId": null,
// "deliveryInfoDefault": null,
// "picUrl": "https://lh3.googleusercontent.com/-fAVQZQChnaQ/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucni36gSmnKFU00TOGF7vIDG_tdqKg/s96-c/photo.jpg",
// "accountPhone": null,
// "facebookId": null,
// "presenterId": null,
// "partnerId": null,
// "lastBalance": 0,
// "customerType": null,
// "partner": null,
// "presenter": null,
// "inversePresenter": [],
// "membership": []
// }

class CustomerModel {
  int id;
  String name;
  String address;
  String phone;
  String fax;
  String contactPerson;
  String contactPersonNumber;
  String website;
  String email;
  int type;
  int accountId;
  String idCard;
  bool gender;
  String birthDay;
  int storeRegisterId;
  String district;
  String city;
  String customerCode;
  int customerTypeId;
  int brandId;
  int deliveryInfoDefault;
  String picUrl;
  String accountPhone;
  String facebookId;
  int presenterId;
  int partnerId;
  double lastBalance;

  CustomerModel({
    this.id,
    this.name: '',
    this.address: '',
    this.phone: '',
    this.fax: '',
    this.contactPerson: '',
    this.contactPersonNumber: '',
    this.website: '',
    this.email: '',
    this.type: 0,
    this.accountId = 0,
    this.idCard: '',
    this.gender,
    this.birthDay: '',
    this.storeRegisterId: 0,
    this.district: '',
    this.city: '',
    this.customerCode: '',
    this.customerTypeId: 0,
    this.brandId: 0,
    this.deliveryInfoDefault: 0,
    this.picUrl: '',
    this.accountPhone: '',
    this.facebookId: '',
    this.presenterId: 0,
    this.partnerId: 0,
    this.lastBalance: 0,
  });

  CustomerModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'] ?? 0;
    this.name = map['name'] ?? '';
    this.address = map['address'] ?? '';
    this.phone = map['phone'] ?? '';
    this.fax = map['fax'] ?? '';
    this.contactPerson = map['contactPerson'] ?? '';
    this.contactPersonNumber = map['contactPersonNumber'] ?? '';
    this.website = map['website'] ?? '';
    this.email = map['email'] ?? '';
    this.type = map['type'] ?? 0;
    this.accountId = map['accountId'] ?? 0;
    this.idCard = map['idcard'] ?? '';
    this.gender = map['gender'] ?? null;
    this.birthDay = map['birthDay'] ?? '';
    this.storeRegisterId = map['storeRegisterId'] ?? 0;
    this.district = map['district'] ?? '';
    this.city = map['city'] ?? '';
    this.customerCode = map['customerCode'] ?? '';
    this.customerTypeId = map['customerTypeId'] ?? 0;
    this.brandId = map['brandId'] ?? 0;
    this.deliveryInfoDefault = map['deliveryInfoDefault'] ?? 0;
    this.picUrl = map['picUrl'] ?? '';
    this.accountPhone = map['accountPhone'] ?? '';
    this.facebookId = map['facebookId'] ?? '';
    this.presenterId = map['presenterId'] ?? 0;
    this.partnerId = map['partnerId'] ?? 0;
    this.lastBalance = map['lastBalance'] ?? 0;
  }

  Map<String, dynamic> getUpdateParam() {
    return <String, dynamic>{
      'name': this.name,
      'birthDay': this.birthDay,
      'gender': this.gender,
      'picUrl': this.picUrl,
    };
  }
}
