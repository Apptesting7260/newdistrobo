import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SingleProductPageModel {
  SingleProductPageModel({
     this.singleProduct,
     this.variations,
  });
  SingleProduct? singleProduct;
     var variations;

  SingleProductPageModel.fromJson(Map<String, dynamic> json){
    singleProduct = SingleProduct.fromJson(json['single_product']);
    variations = json['variations'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['single_product'] = singleProduct!.toJson();
    _data['variations'] = variations;
    return _data;
  }
}

class SingleProduct {
  SingleProduct({
     this.productId,
     this.productImg,
     this.productTitle,
     this.productSlug,
     this.productPrice,
     this.productWishlist,
     this.productDelivery,
     this.productCartKey,
     this.productCategories,
     this.productSku,
     this.productQuantity,
     this.productKey,
     this.productCartQuantity,
  });
var productId;
var productImg;
var productTitle;
var productSlug;
var productPrice;
  var productWishlist;
var productDelivery;
var productCartKey;
  List<ProductCategories> ? productCategories;
var productSku;
var productQuantity;
var productKey;
 var productCartQuantity;
  RxBool productWishlistbool = false.obs;
  RxBool isLoding = false.obs;
  RxBool cartLoding= false.obs;
  var productlocalCartQuantity=0.obs;

  SingleProduct.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productPrice = json['product_price'];
    productWishlist = json['product_wishlist'];
    productDelivery = json['product_delivery'];
    productCartKey = json['product_cart_key'];
    productCategories = List.from(json['product_categories']).map((e)=>ProductCategories.fromJson(e)).toList();
    productSku = json['product_sku'];
    productQuantity = json['product_quantity'];
    productKey = json['product_key'];
    productCartQuantity = json['product_cart_quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_img'] = productImg;
    _data['product_title'] = productTitle;
    _data['product_slug'] = productSlug;
    _data['product_price'] = productPrice;
    _data['product_wishlist'] = productWishlist;
    _data['product_delivery'] = productDelivery;
    _data['product_cart_key'] = productCartKey;
    _data['product_categories'] = productCategories!.map((e)=>e.toJson()).toList();
    _data['product_sku'] = productSku;
    _data['product_quantity'] = productQuantity;
    _data['product_key'] = productKey;
    _data['product_cart_quantity'] = productCartQuantity;
    return _data;
  }
}

class ProductCategories {
  ProductCategories({
     this.category,
  });
var category;

  ProductCategories.fromJson(Map<String, dynamic> json){
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    return _data;
  }
}