class ItemCountCartModel {
  ItemCountCartModel({
     this.cartCount,
  });
   var cartCount;
  
  ItemCountCartModel.fromJson(Map<String, dynamic> json){
    cartCount = json['cart_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart_count'] = cartCount;
    return _data;
  }
}