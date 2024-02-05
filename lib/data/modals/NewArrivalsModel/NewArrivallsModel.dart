import 'package:get/get.dart';

import '../../../GlobaleVarribale/Globalevarribale.dart';

class NewArivallProductModel {
  NewArivallProductModel({
     this.latestProducts,
     this.currentPage,
     this.totalPages,
  });
 RxList<LatestProducts>? latestProducts;
  var currentPage;
  var totalPages;

  NewArivallProductModel.fromJson(Map<String, dynamic> json){
    // latestProducts = List.from(json['latest_products']).map((e)=>LatestProducts.fromJson(e)).toList();
    if (json['latest_products'] != null) {
      print(json['latest_products']);
      latestProducts = <LatestProducts>[].obs;
      json['latest_products'].forEach((v) {
        latestProducts!.add(new LatestProducts.fromJson(v));
      });
    }
    if(latestProducts != null && latestProducts!.isNotEmpty){
      print('yES NOT EMPTY');
      if(latestProducts!.length < 10){
        noDataHome.value = true;
        callArrivalPagination.value = false;
        print('yES  EMPTY==================');
      }

      if(latestProducts!.length == 10){
        new_arri_page++;
        callArrivalPagination.value = true;
        print('yES not EMPTY==================');
      }

      latestProduct.addAll(latestProducts as Iterable<LatestProducts>)  ;

    }
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latest_products'] = latestProducts!.map((e)=>e.toJson()).toList();
    _data['current_page'] = currentPage;
    _data['total_pages'] = totalPages;
    return _data;
  }
}



class LatestProducts {
  LatestProducts({
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
  RxBool cartLoding = false.obs;
  var productlocalCartQuantity = 0.obs;

  RxBool productWishlistbool = false.obs;
  RxBool isLoding = false.obs;


  LatestProducts.fromJson(Map<String, dynamic> json){
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


// import 'package:get/get.dart';
//
// import '../../../GlobaleVarribale/Globalevarribale.dart';
//
//   class NewArivallProductModel {
//   NewArivallProductModel({
//      this.latestProducts,
//      this.currentPage,
//      this.totalPages,
//   });
//   RxList<LatestProducts>? latestProducts;
// var currentPage;
// var totalPages;
//
//   NewArivallProductModel.fromJson(Map<String, dynamic> json){
//     // latestProducts = LatestProducts.fromJson(json['latest_products']) ;
//     if (json['latest_products'] != null) {
//       print(json['latest_products']);
//       latestProducts = <LatestProducts>[].obs;
//       json['latest_products'].forEach((v) {
//         latestProducts!.add(new LatestProducts.fromJson(v));
//       });
//     }
//     if(latestProducts != null && latestProducts!.isNotEmpty){
//       print('yES NOT EMPTY');
//       if(latestProducts!.length < 10){
//         noDataHome.value = true;
//         callHomePagination.value = false;
//         print('yES  EMPTY==================');
//       }
//
//       if(latestProducts!.length == 10){
//         new_arri_page++;
//         callArrivalPagination.value = true;
//         print('yES not EMPTY==================');
//       }
//
//       latestProduct.addAll(latestProducts as Iterable<LatestProducts>)  ;
//
//     }
//     currentPage = json['current_page'];
//     totalPages = json['total_pages'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['latest_products'] = latestProducts!.toJson();
//     _data['current_page'] = currentPage;
//     _data['total_pages'] = totalPages;
//     return _data;
//   }
// }
//
// class LatestProducts {
//   LatestProducts({
//      this.latestSimpleProducts,
//      this.latestVariableProducts,
//   });
//    List<LatestSimpleProducts>? latestSimpleProducts;
//  List<LatestVariableProducts>? latestVariableProducts;
//
//   LatestProducts.fromJson(Map<String, dynamic> json){
//     latestSimpleProducts = List.from(json['latest_simple_products']).map((e)=>LatestSimpleProducts.fromJson(e)).toList();
//     latestVariableProducts = List.from(json['latest_variable_products']).map((e)=>LatestVariableProducts.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['latest_simple_products'] = latestSimpleProducts!.map((e)=>e.toJson()).toList();
//     _data['latest_variable_products'] = latestVariableProducts!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class LatestSimpleProducts {
//   LatestSimpleProducts({
//      this.productId,
//      this.productName,
//      this.productQuantity,
//      this.productImage,
//      this.productPrice,
//      this.productCategory,
//      this.productWishlist,
//   });
// var productId;
//   var productName;
//   var productQuantity;
//   var productImage;
//   var productPrice;
//   var productCategory;
//   var productWishlist;
//
//   LatestSimpleProducts.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productName = json['product_name'];
//     productQuantity = json['product_quantity'];
//     productImage = json['product_image'];
//     productPrice = json['product_price'];
//     productCategory = json['product_category'];
//     productWishlist = json['product_wishlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_name'] = productName;
//     _data['product_quantity'] = productQuantity;
//     _data['product_image'] = productImage;
//     _data['product_price'] = productPrice;
//     _data['product_category'] = productCategory;
//     _data['product_wishlist'] = productWishlist;
//     return _data;
//   }
// }
//
// class LatestVariableProducts {
//   LatestVariableProducts({
//      this.productId,
//      this.productName,
//      this.productQuantity,
//      this.productImage,
//      this.productPrice,
//      this.productCategory,
//      this.productWishlist,
//   });
// var productId;
//   var productName;
//   var productQuantity;
//   var productImage;
//   var productPrice;
//   var productCategory;
//   var productWishlist;
//
//   LatestVariableProducts.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productName = json['product_name'];
//     productQuantity = json['product_quantity'];
//     productImage = json['product_image'];
//     productPrice = json['product_price'];
//     productCategory = json['product_category'];
//     productWishlist = json['product_wishlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_name'] = productName;
//     _data['product_quantity'] = productQuantity;
//     _data['product_image'] = productImage;
//     _data['product_price'] = productPrice;
//     _data['product_category'] = productCategory;
//     _data['product_wishlist'] = productWishlist;
//     return _data;
//   }
// }