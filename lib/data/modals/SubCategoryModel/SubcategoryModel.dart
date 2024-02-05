import 'package:get/get_rx/src/rx_types/rx_types.dart';


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
     this.id,
     this.name,
     this.subcategoriesExist,
     this.catPosts,
  });
  var id;
  var name;
  var subcategoriesExist;
 List<CatPosts>? catPosts;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    subcategoriesExist = json['subcategories_exist'];
    catPosts = List.from(json['cat_posts']).map((e)=>CatPosts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['subcategories_exist'] = subcategoriesExist;
    _data['cat_posts'] = catPosts!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CatPosts {
  CatPosts({
     this.productId,
     this.productImg,
     this.productTitle,
     this.productSlug,
     this.productPrice,
     this.productWishlist,
     this.productCartKey,
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
  var productQuantity;
  var productKey;
  var productCartQuantity;
  var productType;
  RxBool productWishlistbool=false.obs;
  RxBool isLoding=false.obs;
  RxBool cartLoding= false.obs;
  var productlocalCartQuantity=0.obs;

  CatPosts.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productPrice = json['product_price'];
    productWishlist = json['product_wishlist'];
    productCartKey = json['product_cart_key'];
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
    _data['product_quantity'] = productQuantity;
    _data['product_key'] = productKey;
    _data['product_cart_quantity'] = productCartQuantity;
    _data['product_type'] = productType;
    return _data;
  }
}

// class SubCategoryModel {
//   SubCategoryModel({
//      this.data,
//   });
//   List<Data>? data;
//
//   SubCategoryModel.fromJson(Map<String, dynamic> json){
//     data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//      this.subcategoryId,
//      this.subcategoryName,
//      this.subSubcategoriesExist,
//      this.products,
//   });
//   var subcategoryId;
//   var subcategoryName;
//   var subSubcategoriesExist;
//    List<Products>? products;
//
//   Data.fromJson(Map<String, dynamic> json){
//     subcategoryId = json['subcategory_id'];
//     subcategoryName = json['subcategory_name'];
//     subSubcategoriesExist = json['sub_subcategories_exist'];
//     products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['subcategory_id'] = subcategoryId;
//     _data['subcategory_name'] = subcategoryName;
//     _data['sub_subcategories_exist'] = subSubcategoriesExist;
//     _data['products'] = products!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Products {
//   Products({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productPrice,
//     this.productInWishlist,
//      this.productQuantity,
//      this.productType,
//   });
//   var productId;
//   var productImg;
//   var productTitle;
//   var productSlug;
//   var productPrice;
//   var productInWishlist;
//   var productQuantity;
//   var  productType;
//   RxBool productWishlistbool=false.obs;
//   RxBool isLoding=false.obs;
//
//   var  productCartQuantity;
//   var productKey;
//   var productCartKey;
//   RxBool cartLoding= false.obs;
//   var productlocalCartQuantity=0.obs;
//
//   Products.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productPrice = json['product_price'];
//     productInWishlist = json['product_in_wishlist'];
//     productQuantity = json['product_quantity'];
//     productType = json['product_type'];
//     productKey = json['product_key'];
//     productCartQuantity = json['product_cart_quantity'];
//     productCartKey = json['product_cart_key'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_price'] = productPrice;
//     _data['product_in_wishlist'] = productInWishlist;
//     _data['product_quantity'] = productQuantity;
//     _data['product_type'] = productType;
//     _data['product_key'] = productKey;
//     _data['product_cart_quantity'] = productCartQuantity;
//     _data['product_cart_key'] = productCartKey;
//     return _data;
//   }
// }