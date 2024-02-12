import 'package:get/get.dart';

class HomePageModel {
  HomePageModel({
    this.data,
  });

  Data? data;

  HomePageModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.bannerSection,
    this.homeCategory,
    this.categoryBannerSection,
    this.categoryDetails,
  });

  List<BannerSection>? bannerSection;
  List<HomeCategory>? homeCategory;
  List<CategoryBannerSection>? categoryBannerSection;
  List<CategoryDetails>? categoryDetails;

  Data.fromJson(Map<String, dynamic> json) {
    bannerSection = List.from(json['banner_section'])
        .map((e) => BannerSection.fromJson(e))
        .toList();
    homeCategory = List.from(json['home_category'])
        .map((e) => HomeCategory.fromJson(e))
        .toList();
    categoryBannerSection = List.from(json['category_banner_section'])
        .map((e) => CategoryBannerSection.fromJson(e))
        .toList();
    categoryDetails = List.from(json['category_details'])
        .map((e) => CategoryDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banner_section'] = bannerSection!.map((e) => e.toJson()).toList();
    _data['home_category'] = homeCategory!.map((e) => e.toJson()).toList();
    _data['category_banner_section'] =
        categoryBannerSection!.map((e) => e.toJson()).toList();
    _data['category_details'] =
        categoryDetails!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class BannerSection {
  BannerSection({
    this.bannerImage,
  });

  var bannerImage;

  BannerSection.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banner_image'] = bannerImage;
    return _data;
  }
}

class HomeCategory {
  HomeCategory({
    this.categoryId,
    this.categoryIcon,
    this.categoryName,
    this.subcategoriesExist,
  });

  var categoryId;
  var categoryIcon;
  var categoryName;
  var subcategoriesExist;

  HomeCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryIcon = json['category_icon'];
    categoryName = json['category_name'];
    subcategoriesExist = json['subcategories_exist'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['category_icon'] = categoryIcon;
    _data['category_name'] = categoryName;
    _data['subcategories_exist'] = subcategoriesExist;
    return _data;
  }
}

class CategoryBannerSection {
  CategoryBannerSection({
    this.categoryBannerId,
    this.categoryBannerName,
    this.categoryBannerImage,
    this.subcategoriesExist,
  });

  var categoryBannerId;
  var categoryBannerName;
  var categoryBannerImage;
  var subcategoriesExist;

  CategoryBannerSection.fromJson(Map<String, dynamic> json) {
    categoryBannerId = json['category_banner_id'];
    categoryBannerName = json['category_banner_name'];
    categoryBannerImage = json['category_banner_image'];
    subcategoriesExist = json['subcategories_exist'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_banner_id'] = categoryBannerId;
    _data['category_banner_name'] = categoryBannerName;
    _data['category_banner_image'] = categoryBannerImage;
    _data['subcategories_exist'] = subcategoriesExist;
    return _data;
  }
}

class CategoryDetails {
  CategoryDetails({
    this.id,
    this.name,
    this.subcategoriesExist,
    this.catPosts,
  });

  var id;
  var name;
  var subcategoriesExist;
  List<CatPosts>? catPosts;

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subcategoriesExist = json['subcategories_exist'];
    catPosts =
        List.from(json['cat_posts']).map((e) => CatPosts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['subcategories_exist'] = subcategoriesExist;
    _data['cat_posts'] = catPosts!.map((e) => e.toJson()).toList();
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
     this.perItemPrice,
     this.bulkItmes,
  });

  var productId;
  var productImg;
  var productTitle;
  var productSlug;
  var productPrice;
  var productWishlist;
  var productCartKey;
  var productQuantity;

  var productlocalCartQuantity=0.obs;
  RxBool productWishlistbool = false.obs;
  RxBool isLoding = false.obs;
  RxBool cartLoding= false.obs;
  var productKey;
  var productCartQuantity;
 var perItemPrice;
 var bulkItmes;
  var productType;

  CatPosts.fromJson(Map<String, dynamic> json) {
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
    perItemPrice = json['per_item_price'];
    bulkItmes = json['bulk_itmes'];
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
    _data['per_item_price'] = perItemPrice;
    _data['bulk_itmes'] = bulkItmes;
    return _data;
  }
}

//
//
// class HomePageModel {
//   HomePageModel({
//      this.data,
//   });
//    Data ?data;
//
//   HomePageModel.fromJson(Map<String, dynamic> json){
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data?.toJson();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//      this.bannerSection,
//      this.homeCategory,
//      this.categoryBannerSection,
//      this.categoryDetails,
//   });
//  List<BannerSection>? bannerSection;
// List<HomeCategory>? homeCategory;
//  List<CategoryBannerSection>? categoryBannerSection;
//    List<CategoryDetails>? categoryDetails;
//
//   Data.fromJson(Map<String, dynamic> json){
//     bannerSection = List.from(json['banner_section']).map((e)=>BannerSection.fromJson(e)).toList();
//     homeCategory = List.from(json['home_category']).map((e)=>HomeCategory.fromJson(e)).toList();
//     categoryBannerSection = List.from(json['category_banner_section']).map((e)=>CategoryBannerSection.fromJson(e)).toList();
//     categoryDetails = List.from(json['category_details'])!.map((e)=>CategoryDetails.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['banner_section'] = bannerSection!.map((e)=>e.toJson()).toList();
//     _data['home_category'] = homeCategory!.map((e)=>e.toJson()).toList();
//     _data['category_banner_section'] = categoryBannerSection!.map((e)=>e.toJson()).toList();
//     _data['category_details'] = categoryDetails!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class BannerSection {
//   BannerSection({
//      this.bannerImage,
//   });
// var bannerImage;
//
//   BannerSection.fromJson(Map<String, dynamic> json){
//     bannerImage = json['banner_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['banner_image'] = bannerImage;
//     return _data;
//   }
// }
//
// class HomeCategory {
//   HomeCategory({
//      this.categoryId,
//      this.categoryIcon,
//      this.categoryName,
//   });
//   var categoryId;
//   var categoryIcon;
// var categoryName;
//
//   HomeCategory.fromJson(Map<String, dynamic> json){
//     categoryId = json['category_id'];
//     categoryIcon = json['category_icon'];
//     categoryName = json['category_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_id'] = categoryId;
//     _data['category_icon'] = categoryIcon;
//     _data['category_name'] = categoryName;
//     return _data;
//   }
// }
//
// class CategoryBannerSection {
//   CategoryBannerSection({
//      this.categoryBannerId,
//      this.categoryBannerImage,
//   });
// var categoryBannerId;
// var categoryBannerImage;
//
//   CategoryBannerSection.fromJson(Map<String, dynamic> json){
//     categoryBannerId = json['category_banner_id'];
//     categoryBannerImage = json['category_banner_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_banner_id'] = categoryBannerId;
//     _data['category_banner_image'] = categoryBannerImage;
//     return _data;
//   }
// }
//
// class CategoryDetails {
//   CategoryDetails({
//      this.id,
//      this.name,
//      this.catPosts,
//   });
//  var id;
//   var name;
//  List<CatPosts>? catPosts;
//
//   CategoryDetails.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     catPosts = List.from(json['cat_posts']).map((e)=>CatPosts.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['cat_posts'] = catPosts!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class CatPosts {
//   CatPosts({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productPrice,
//      this.productWishlist,
//   });
//  var productId;
//   var productImg;
//   var productTitle;
//   var productSlug;
//   var productPrice;
//   var productWishlist;
//   RxBool productWishlistbool=false.obs;
//   RxBool isLoding=false.obs;
//
//   CatPosts.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productPrice = json['product_price'];
//     productWishlist = json['product_wishlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_price'] = productPrice;
//     _data['product_wishlist'] = productWishlist;
//     return _data;
//   }
// }
//

//
// class HomePageModel {
//   HomePageModel({
//      this.data,
//   });
//    Data? data;
//
//   HomePageModel.fromJson(Map<String, dynamic> json){
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data!.toJson();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//      this.bannerSection,
//      this.homeCategory,
//      this.categoryBannerSection,
//      this.productCategory1,
//      this.candySnacks,
//      this.productCategory2,
//      this.vitaminsEnergy,
//      this.categoryTitle2,
//      this.categoryTitle,
//   });
//    List<BannerSection>? bannerSection;
//    List<HomeCategory>? homeCategory;
//    List<CategoryBannerSection>? categoryBannerSection;
//   var productCategory1;
//    List<CandySnacks>? candySnacks;
//   var productCategory2;
//    List<VitaminsEnergy>? vitaminsEnergy;
//
//   var  categoryTitle2;
//   var categoryTitle;
//
//   Data.fromJson(Map<String, dynamic> json){
//     bannerSection = List.from(json['banner_section']).map((e)=>BannerSection.fromJson(e)).toList();
//     homeCategory = List.from(json['home_category']).map((e)=>HomeCategory.fromJson(e)).toList();
//     categoryBannerSection = List.from(json['category_banner_section']).map((e)=>CategoryBannerSection.fromJson(e)).toList();
//     productCategory1 = json['product_category1'];
//     candySnacks = List.from(json['candy_snacks']).map((e)=>CandySnacks.fromJson(e)).toList();
//     productCategory2 = json['product_category2'];
//     vitaminsEnergy = List.from(json['vitamins_energy']).map((e)=>VitaminsEnergy.fromJson(e)).toList();
//     categoryTitle2 = json['category_title2'];
//     categoryTitle = json['category_title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['banner_section'] = bannerSection!.map((e)=>e.toJson()).toList();
//     _data['home_category'] = homeCategory!.map((e)=>e.toJson()).toList();
//     _data['category_banner_section'] = categoryBannerSection!.map((e)=>e.toJson()).toList();
//     _data['product_category1'] = productCategory1;
//     _data['candy_snacks'] = candySnacks!.map((e)=>e.toJson()).toList();
//     _data['product_category2'] = productCategory2;
//     _data['vitamins_energy'] = vitaminsEnergy!.map((e)=>e.toJson()).toList();
//     _data['category_title2'] = categoryTitle2;
//     _data['category_title'] = categoryTitle;
//     return _data;
//   }
// }
//
// class BannerSection {
//   BannerSection({
//      this.bannerImage,
//   });
//   var bannerImage;
//
//   BannerSection.fromJson(Map<String, dynamic> json){
//     bannerImage = json['banner_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['banner_image'] = bannerImage;
//     return _data;
//   }
// }
//
// class HomeCategory {
//   HomeCategory({
//      this.categoryId,
//      this.categoryIcon,
//      this.categoryName,
//   });
//   var categoryId;
//   var categoryIcon;
//   var categoryName;
//
//   HomeCategory.fromJson(Map<String, dynamic> json){
//     categoryId = json['category_id'];
//     categoryIcon = json['category_icon'];
//     categoryName = json['category_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_id'] = categoryId;
//     _data['category_icon'] = categoryIcon;
//     _data['category_name'] = categoryName;
//     return _data;
//   }
// }
//
// class CategoryBannerSection {
//   CategoryBannerSection({
//      this.categoryBannerId,
//      this.categoryBannerImage,
//   });
//   var categoryBannerId;
//   var categoryBannerImage;
//
//   CategoryBannerSection.fromJson(Map<String, dynamic> json){
//     categoryBannerId = json['category_banner_id'];
//     categoryBannerImage = json['category_banner_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_banner_id'] = categoryBannerId;
//     _data['category_banner_image'] = categoryBannerImage;
//     return _data;
//   }
// }
//
// class CandySnacks {
//   CandySnacks({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productPrice,
//      this.productWishlist,
//   });
// var productId;
//   var productImg;
//   var productTitle;
//   var productSlug;
//   var productPrice;
//   var productWishlist;
//   RxBool productWishlistbool=false.obs;
//
//   RxBool isLoding=false.obs;
//
//   CandySnacks.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productPrice = json['product_price'];
//     productWishlist = json['product_wishlist'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_price'] = productPrice;
//     _data['product_wishlist'] = productWishlist;
//     return _data;
//   }
// }
//
// class VitaminsEnergy {
//   VitaminsEnergy({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productPrice,
//      this.productWishlist,
//
//   });
//   var productId;
//   var productImg;
//   var productTitle;
//   var productSlug;
//   var productPrice;
//   var productWishlist;
//   RxBool isLoding=false.obs;
//   RxBool productWishlistbool=false.obs;
//
//   VitaminsEnergy.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productPrice = json['product_price'];
//     productWishlist = json['product_wishlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_price'] = productPrice;
//     _data['product_wishlist'] = productWishlist;
//     return _data;
//   }
// }
//
//
// class CategoryDetails {
//   CategoryDetails({
//      this.id,
//      this.name,
//      this.catPosts,
//   });
//  var id;
//   var name;
//  List<CatPosts>? catPosts;
//
//   CategoryDetails.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     catPosts = List.from(json['cat_posts']).map((e)=>CatPosts.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['cat_posts'] = catPosts!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class CatPosts {
//   CatPosts({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productPrice,
//      this.productWishlist,
//   });
//   var productId;
//   var productImg;
//   var productTitle;
//   var productSlug;
//   var productPrice;
//   var productWishlist;
//
//   CatPosts.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productPrice = json['product_price'];
//     productWishlist = json['product_wishlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_price'] = productPrice;
//     _data['product_wishlist'] = productWishlist;
//     return _data;
//   }
// }
