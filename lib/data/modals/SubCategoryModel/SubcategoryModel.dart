class SubCategoryModel {
  SubCategoryModel({
     this.data,
  });
 List<Data>? data;

  SubCategoryModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
     this.categoryStatus,
     this.categoryData,
  });
  var categoryStatus;
   List<CategoryData>? categoryData;

  Data.fromJson(Map<String, dynamic> json){
    categoryStatus = json['category_status'];
    categoryData = List.from(json['category_data']).map((e)=>CategoryData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_status'] = categoryStatus;
    _data['category_data'] = categoryData!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CategoryData {
  CategoryData({
    required this.id,
    required this.img,
    required this.name,
    required this.productCount,
  });
  late final int id;
  late final String img;
  late final String name;
  late final int productCount;

  CategoryData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    img = json['img'];
    name = json['name'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['img'] = img;
    _data['name'] = name;
    _data['product_count'] = productCount;
    return _data;
  }
}