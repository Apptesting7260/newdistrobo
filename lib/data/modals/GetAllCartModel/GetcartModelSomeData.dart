class OrderDetailsTocart {
  OrderDetailsTocart({
     this.data,
  });

   Data? data;

  OrderDetailsTocart.fromJson(Map<String, dynamic> json) {
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
    required this.items,
    required this.coupons,
    required this.cartTotal,
  });

  late final List<Items> items;
  late final String coupons;
  late final CartTotal cartTotal;

  Data.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    coupons = json['coupons'];
    cartTotal = CartTotal.fromJson(json['cart_total']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['coupons'] = coupons;
    _data['cart_total'] = cartTotal.toJson();
    return _data;
  }
}

class Items {
  Items({
    required this.productId,
    required this.quantity,
  });

  late final int productId;

  late final int quantity;

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];

    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['product_id'] = productId;

    _data['quantity'] = quantity;

    return _data;
  }
}

class CartTotal {
  CartTotal({
    required this.subtotal,
    required this.discountTotal,
    required this.total,
  });

  late final String subtotal;
  late final int discountTotal;
  late final String total;

  CartTotal.fromJson(Map<String, dynamic> json) {
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
