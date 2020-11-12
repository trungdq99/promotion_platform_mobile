// Author: Trung Shin
// id*	integer($int32)
// customerId	integer($int32)
// csv	string
// active	boolean
// status	integer($int32)
// createdTime	string($date-time)
// brandId	integer($int32)
// brandName	string
// level	integer($int32)
// membershipTypeId	integer($int32)
// isSample	boolean
// storeId	integer($int32)
// productCode	string
// initialValue	number($double)
// createBy	string
// physicalCardCode	string
class MembershipModel {
  int id;
  int customerId;
  String csv;
  bool active;
  int status;
  String createdTime;
  int brandId;
  String brandName;
  int level;
  int membershipType;
  String membershipTypeName;
  bool isSample;
  int storeId;
  String productCode;
  double initialValue;
  String createBy;
  String physicalCardCode;

  MembershipModel({
    this.id,
    this.customerId: 0,
    this.csv: '',
    this.active: false,
    this.status: 0,
    this.createdTime: '',
    this.brandId: 0,
    this.brandName: '',
    this.level: 0,
    this.membershipType: 0,
    this.membershipTypeName: '',
    this.isSample: false,
    this.storeId: 0,
    this.productCode: '',
    this.initialValue: 0,
    this.createBy: '',
    this.physicalCardCode: '',
  });

  MembershipModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    // this.customerId = map['customerId'] ?? 0;
    // this.csv = map['csv'] ?? '';
    this.active = map['active'] ?? false;
    // this.status = map['status'] ?? 0;
    this.createdTime = map['createdTime'] ?? '';
    // this.brandId = map['brandId'] ?? 0;
    this.brandName = map['brandName'] ?? '';
    // this.level = map['level'] ?? 0;
    // this.membershipType = map['membershipTypeId'] ?? 0;
    this.membershipTypeName = map['membershipTypeName'] ?? 0;
    // this.isSample = map['isSample'] ?? false;
    // this.storeId = map['storeId'] ?? 0;
    // this.productCode = map['productCode'] ?? '';
    // this.initialValue = map['initialValue'] ?? 0;
    // this.createBy = map['createBy'] ?? '';
    // this.physicalCardCode = map['physicalCardCode'] ?? '';
  }

  @override
  String toString() {
    return 'MembershipModel{id: $id, customerId: $customerId, csv: $csv, active: $active, status: $status, createdTime: $createdTime, brandId: $brandId, brandName: $brandName, level: $level, membershipType: $membershipType, isSample: $isSample, storeId: $storeId, productCode: $productCode, initialValue: $initialValue, createBy: $createBy, physicalCardCode: $physicalCardCode}';
  }
}
