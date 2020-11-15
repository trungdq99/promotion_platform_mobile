// Author: Trung Shin
class BrandModel {
  int id;
  String brandName;
  String description;
  String contactPerson;
  String phoneNumber;
  String centerAddress;
  bool isActive;
  String createdDate;
  String fax;
  String website;
  String vatcode;
  String vattemplate;
  String apiSmsKey;
  String securityApiSmsKey;
  int smstype;
  String brandNameSms;
  String brandUrl;
  String imgUrl;
  int numberOfPromotion;

  BrandModel({
    this.id,
    this.brandName: '',
    this.description: '',
    this.contactPerson: '',
    this.phoneNumber: '',
    this.centerAddress: '',
    this.isActive: false,
    this.createdDate: '',
    this.fax: '',
    this.website: '',
    this.vatcode: '',
    this.vattemplate: '',
    this.apiSmsKey: '',
    this.securityApiSmsKey: '',
    this.smstype: 0,
    this.brandNameSms: '',
    this.brandUrl: '',
    this.imgUrl: '',
    this.numberOfPromotion: 0,
  });

  BrandModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.brandName = map['brandName'] ?? '';
    this.description = map['description'] ?? '';
    this.contactPerson = map['contactPerson'] ?? '';
    this.phoneNumber = map['phoneNumber'] ?? '';
    this.brandUrl = map['brandUrl'] ?? '';
    this.imgUrl = map['imgUrl'] ?? '';
    this.numberOfPromotion = map['numberOfPromotion'] ?? 0;
  }
}
