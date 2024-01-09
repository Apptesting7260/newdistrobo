import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../GlobaleVarribale/Globalevarribale.dart';

class ProductCategoryDetailasModel {
   ProductCategoryDetailasModel({
     this.categoryTitle,
     this.productCategory,
     this.currentPage,
     this.totalPages,
  });
var categoryTitle;
 RxList<ProductSubCategory>? productCategory;
  var currentPage;
  var  totalPages;

  ProductCategoryDetailasModel.fromJson(Map<String, dynamic> json){
    categoryTitle = json['category_title'];

    if (json['product_category'] != null) {
      print(json['product_category']);
      productCategory = <ProductSubCategory>[].obs;
      json['product_category'].forEach((v) {
        productCategory!.add(new ProductSubCategory.fromJson(v));
      });
    }
    if(productCategory != null && productCategory!.isNotEmpty){
      print('yES NOT EMPTY');
      if(productCategory!.length < 10){
        noDataHome.value = true;
        callHomePagination.value = false;
        print('yES  EMPTY==================');
      }

      if(productCategory!.length == 10){
        page++;
        callHomePagination.value = true;
        print('yES not EMPTY==================');
      }

      ProductCategoryLists.addAll(productCategory as Iterable<ProductSubCategory>)  ;

    }
    // productCategory = List.from(json['product_category']).map((e)=>ProductSubCategory.fromJson(e)).toList();


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

class ProductSubCategory {
  ProductSubCategory({
     this.productId,
     this.productImg,
     this.productTitle,
     this.productSlug,
     this.productPrice,
     this.productWishlist,
    this.productQuantity,
     this.productType,

  });
  var productId;
  var productImg;
  var productTitle;
  var productSlug;
  var productPrice;
  var productWishlist;
  RxBool productWishlistbool=false.obs;
  RxBool isLoding=false.obs;
  var productQuantity;
  var productType;

  ProductSubCategory.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productPrice = json['product_price'];
    productWishlist = json['product_wishlist'];
    productQuantity = json['product_quantity'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_img'] = productImg;
    _data['product_title'] = productTitle;
    _data['product_slug'] = productSlug;
    _data['product_price'] = productPrice;
    _data['product_wishlist'] = productWishlist;
    _data['product_quantity'] = productQuantity;
    _data['product_type'] = productType;
    return _data;
  }
}