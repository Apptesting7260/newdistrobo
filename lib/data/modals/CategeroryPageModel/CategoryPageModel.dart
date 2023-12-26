class CategoryPageModel {
  CategoryPageModel({
     this.categoryTitle,
     this.productCategory,
     this.currentPage,
     this.totalPages,
  });
   var categoryTitle;
   List<ProductCategory>? productCategory;
   var currentPage;
   var totalPages;

  CategoryPageModel.fromJson(Map<String, dynamic> json){
    categoryTitle = json['category_title'];
    productCategory = List.from(json['product_category']).map((e)=>ProductCategory.fromJson(e)).toList();
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_title'] = categoryTitle;
    _data['product_category'] = productCategory!.map((e)=>e.toJson()).toList();
    _data['current_page'] = currentPage;
    _data['total_pages'] = totalPages;
    return _data;
  }
}

class ProductCategory {
  ProductCategory({
     this.productId,
     this.productImg,
     this.productTitle,
     this.productSlug,
     this.productPrice,
     this.productWishlist,
  });
   var productId;
   var productImg;
   var productTitle;
   var productSlug;
   var productPrice;
   var productWishlist;

  ProductCategory.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productPrice = json['product_price'];
    productWishlist = json['product_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_img'] = productImg;
    _data['product_title'] = productTitle;
    _data['product_slug'] = productSlug;
    _data['product_price'] = productPrice;
    _data['product_wishlist'] = productWishlist;
    return _data;
  }
}