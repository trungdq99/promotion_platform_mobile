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

class PromotionModel {
  int id;
  int promotionId;
  int price;
  String promotionName;
  String startDate;
  String shortDescription;
  String description;
  String imgUrl;
  String brandName;
  String categoryName;
  PromotionModel({
    this.id,
    this.promotionId: 0,
    this.price: 0,
    this.promotionName: '',
    this.startDate: '',
    this.shortDescription: '',
    this.description: '',
    this.imgUrl: '',
    this.brandName: '',
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
    this.brandName = map['brandName'] ?? '';
  }
}
