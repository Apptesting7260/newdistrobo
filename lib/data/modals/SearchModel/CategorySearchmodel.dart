class CategorySearchModel {
  CategorySearchModel({
     this.productCategorySearching,
  });
  ProductCategorySearching? productCategorySearching;

  CategorySearchModel.fromJson(Map<String, dynamic> json){
    productCategorySearching = ProductCategorySearching.fromJson(json['product_category_searching']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_category_searching'] = productCategorySearching!.toJson();
    return _data;
  }
}

class ProductCategorySearching {
  ProductCategorySearching({
     this.searchCategory,
  });
 List<SearchCategory>? searchCategory;

  ProductCategorySearching.fromJson(Map<String, dynamic> json){
    searchCategory = List.from(json['search_category']).map((e)=>SearchCategory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['search_category'] = searchCategory!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SearchCategory {
  SearchCategory({
     this.categoryId,
     this.categoryImg,
     this.categoryName,
     this.subcategoriesExist,
     this.categorySlug,
     this.categoryCount,
  });
 var categoryId;
  var categoryImg;
  var categoryName;
  var subcategoriesExist;
  var categorySlug;
 var categoryCount;

  SearchCategory.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    categoryImg = json['category_img'];
    categoryName = json['category_name'];
    subcategoriesExist = json['subcategories_exist'];
    categorySlug = json['category_slug'];
    categoryCount = json['category_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['category_img'] = categoryImg;
    _data['category_name'] = categoryName;
    _data['subcategories_exist'] = subcategoriesExist;
    _data['category_slug'] = categorySlug;
    _data['category_count'] = categoryCount;
    return _data;
  }
}