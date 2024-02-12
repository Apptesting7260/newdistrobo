import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SearchProductModel {
  SearchProductModel({
     this.productCategory,
  });
 List<ProductCategory>? productCategory;

  SearchProductModel.fromJson(Map<String, dynamic> json){
    productCategory = List.from(json['product_category']).map((e)=>ProductCategory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_category'] = productCategory!.map((e)=>e.toJson()).toList();
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
     this.productCartKey,
     this.perItemPrice,
     this.bulkItmes,
     this.productQuantity,
     this.productKey,
     this.productCartQuantity,
     this.productType,
  });
  var productId;
 var productImg;
 var productTitle;
 var productSlug;
 var productPrice;
var productWishlist;
 var productCartKey;
 var perItemPrice;
 var bulkItmes;
 var productQuantity;
 var productKey;
 var productCartQuantity;
 var productType;
  var productlocalCartQuantity=0.obs;
  RxBool productWishlistbool = false.obs;
  RxBool isLoding = false.obs;
  RxBool cartLoding= false.obs;

  ProductCategory.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productPrice = json['product_price'];
    productWishlist = json['product_wishlist'];
    productCartKey = json['product_cart_key'];
    perItemPrice = json['per_item_price'];
    bulkItmes = json['bulk_itmes'];
    productQuantity = json['product_quantity'];
    productKey = json['product_key'];
    productCartQuantity = json['product_cart_quantity'];
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
    _data['product_cart_key'] = productCartKey;
    _data['per_item_price'] = perItemPrice;
    _data['bulk_itmes'] = bulkItmes;
    _data['product_quantity'] = productQuantity;
    _data['product_key'] = productKey;
    _data['product_cart_quantity'] = productCartQuantity;
    _data['product_type'] = productType;
    return _data;
  }
}