// Author: Trung Shin

class VoucherModel {
  String promotionName;
  String expiredDate;
  String shortDescription;
  String description;
  String imgUrl;
  int brandId;
  String brandName;
  String categoryName;
  int id;
  String voucherCode;
  bool isActive;
  bool isUsed;
  int remainingDay;
  int expirationDay;
  double discountAmount;

  VoucherModel({
    this.id,
    this.promotionName: '',
    this.expirationDay: 0,
    this.imgUrl: '',
    this.brandId: 0,
    this.description: '',
    this.brandName: '',
    this.categoryName: '',
    this.isActive: false,
    this.shortDescription: '',
    this.discountAmount: 0,
    this.expiredDate: '',
    this.isUsed: false,
    this.remainingDay: 0,
    this.voucherCode: '',
  });

  VoucherModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.promotionName = map['promotionName'] ?? '';
    this.expirationDay = map['expirationDay'] ?? 0;
    this.imgUrl = map['imgUrl'] ?? '';
    this.brandId = map['brandId'] ?? 0;
    this.description = map['description'] ?? '';
    this.brandName = map['brandName'] ?? '';
    this.categoryName = map['categoryName'] ?? '';
    this.isActive = map['isActive'] ?? false;
    this.shortDescription = map['shortDescription'] ?? '';
    this.discountAmount = map['discountAmount'] ?? 0;
    this.expiredDate = map['expiredDate'] ?? '';
    this.isUsed = map['isUsed'] ?? false;
    this.remainingDay = map['remainingDay'] ?? 0;
    this.voucherCode = map['voucherCode'] ?? '';
  }
}
