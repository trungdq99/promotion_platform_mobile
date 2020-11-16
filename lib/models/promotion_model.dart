// Author: Trung Shin

// id*	integer($int64)
// promotionId*	integer($int64)
// price	integer($int32)
// promotionName	string
// startDate*	string($date-time)
// shortDescription	string
// description	string
// imgUrl	string
// brandName	string

import 'package:promotion_platform/models/brand_model.dart';

class PromotionModel {
  int id;
  int promotionId;
  int price;
  String promotionName;
  String startDate;
  String shortDescription;
  String description;
  String imgUrl;
  String categoryName;
  int voucherGroupId;
  BrandModel brandModel;

  PromotionModel({
    this.id,
    this.promotionId: 0,
    this.price: 0,
    this.promotionName: '',
    this.startDate: '',
    this.shortDescription: '',
    this.description: '',
    this.imgUrl: '',
    this.voucherGroupId: 0,
    this.categoryName: '',
    this.brandModel,
  });

  PromotionModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.promotionId = map['promotionId'] ?? 0;
    this.price = map['price'] ?? 0;
    this.promotionName = map['promotionName'] ?? '';
    this.startDate = map['startDate'] ?? '';
    this.shortDescription = map['shortDescription'] ?? '';
    this.description = map['description'] ?? '';
    this.imgUrl = map['imgUrl'] ?? '';
    this.voucherGroupId = map['voucherGroupId'] ?? 0;
    this.categoryName = map['categoryName'] ?? '';
    Map<String, dynamic> brandDataSet = map['brandDataSet'];
    this.brandModel = BrandModel.fromMap(brandDataSet);
  }
}
