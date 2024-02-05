class ViewWhishListModel {
  ViewWhishListModel({
     this.listProduct,
  });
List<ListProduct> ? listProduct;

  ViewWhishListModel.fromJson(Map<String, dynamic> json){
    listProduct = List.from(json['list_product']).map((e)=>ListProduct.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['list_product'] = listProduct!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ListProduct {
  ListProduct({
     this.productId,
     this.productData,
  });
  var productId;
   ProductData? productData;

  ListProduct.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productData = ProductData.fromJson(json['product_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_data'] = productData!.toJson();
    return _data;
  }
}

class ProductData {
  ProductData({
     this.productId,
     this.productName,
     this.productPrice,
     this.productImage,
  });
  var productId;
  var productName;
  var productPrice;
  var productImage;

  ProductData.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['product_price'] = productPrice;
    _data['product_image'] = productImage;
    return _data;
  }
}