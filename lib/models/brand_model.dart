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

  BrandModel({
    this.id: 0,
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
  });

  BrandModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.brandName = map['brandName'];
    this.description = map['description'];
    this.contactPerson = map['contactPerson'];
    this.phoneNumber = map['phoneNumber'];
  }
}
