import 'package:get/get.dart';

class CategoryDetailasModel {
  CategoryDetailasModel({
     this.data,
  });
 List<Data>? data;

  CategoryDetailasModel.fromJson(Map<String, dynamic> json){
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
     this.categoryName,
     this.productData,
  });
 var categoryStatus;
 var categoryName;
  List<ProductData>? productData;

  Data.fromJson(Map<String, dynamic> json){
    categoryStatus = json['category_status'];
    categoryName = json['category_name'];
    productData = List.from(json['product_data']).map((e)=>ProductData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_status'] = categoryStatus;
    _data['category_name'] = categoryName;
    _data['product_data'] = productData!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductData {
  ProductData({
     this.productId,
     this.productImg,
     this.productTitle,
     this.productSlug,
     this.productPrice,
     this.productWishlist,
    this.productQuantity,
     this.productType,
    this.productKey,
    this.productCartKey,
    this.productCartQuantity
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
 var  productCartQuantity;
  var productKey;
  var productCartKey;
  RxBool cartLoding= false.obs;
  var productlocalCartQuantity=0.obs;


  ProductData.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productPrice = json['product_price'];
    productWishlist = json['product_wishlist'];
    productQuantity = json['product_quantity'];
    productType = json['product_type'];
    productKey = json['product_key'];
    productCartQuantity = json['product_cart_quantity'];
    productCartKey = json['product_cart_key'];
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
    _data['product_key'] = productKey;
    _data['product_cart_quantity'] = productCartQuantity;
    _data['product_cart_key'] = productCartKey;
    return _data;
  }
}