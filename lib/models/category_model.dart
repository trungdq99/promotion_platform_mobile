// Author: Trung Shin

class CategoryModel {
  int id;
  String categoryName;
  String categoryType;
  bool isActive;

  CategoryModel({
    this.id,
    this.categoryName: '',
    this.categoryType: '',
    this.isActive: false,
  });

  CategoryModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.categoryName = map['categoryName'] ?? '';
    this.categoryType = map['categoryType'] ?? '';
    this.isActive = map['isActive'] ?? false;
  }
}
