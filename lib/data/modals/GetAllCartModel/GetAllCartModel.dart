import 'package:get/get.dart';

class GetAllCartModel {
  GetAllCartModel({
     this.data,
  });
  Data ?data;
  
  GetAllCartModel.fromJson(Map<String, dynamic> json){
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
      this.items,
     this.cartTotal,
  });
   List<Items>? items;
  CartTotal? cartTotal;

  Data.fromJson(Map<String, dynamic> json){
    try {
      items = json['items'] == null ? [] : List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    } catch (e) {
      // Handle any exceptions that occur during parsing 'items'
      print('Error parsing items: $e');
      items = []; // Provide a default value or handle the error appropriately
    }
   if(json['cart_total'] is List){

   }
   else{
     cartTotal = CartTotal.fromJson(json['cart_total']) ;
   }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items!.map((e)=>e.toJson()).toList();
    _data['cart_total'] = cartTotal!.toJson();
    return _data;
  }
}

class Items {
  Items({
     this.itemKey,
     this.productId,
     this.productName,
     this.image,
     this.quantity,
     this.price,
  });
  var itemKey;
  int? productId;
  String? productName;
  String? image;
  int? quantity;
//  RxInt quantityy=0.obs;
 var quantityy=1.obs;
 var price;
 RxString pricee="".obs;
  
  Items.fromJson(Map<String, dynamic> json){
    itemKey = json['item_key'];
    productId = json['product_id'];
    productName = json['product_name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item_key'] = itemKey;
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['image'] = image;
    _data['quantity'] = quantity;
    _data['price'] = price;
    return _data;
  }
}

class CartTotal {
  CartTotal({
     this.subtotal,
     this.discountTotal,
     this.total,
  });
  var subtotal;
    var localTotal=0.0.obs;
  var discountTotal;
var total;
  
  CartTotal.fromJson(Map<String, dynamic> json){
    subtotal = json['subtotal'];
    discountTotal = json['discount_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subtotal'] = subtotal;
    _data['discount_total'] = discountTotal;
    _data['total'] = total;
    return _data;
  }
}