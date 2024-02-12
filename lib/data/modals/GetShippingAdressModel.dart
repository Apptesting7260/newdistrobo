class GetShippingafressModel {
  GetShippingafressModel({
     this.shippingAddress,
  });
 ShippingAddress? shippingAddress;

  GetShippingafressModel.fromJson(Map<String, dynamic> json){
    shippingAddress = ShippingAddress.fromJson(json['shipping_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['shipping_address'] = shippingAddress!.toJson();
    return _data;
  }
}

class ShippingAddress {
  ShippingAddress({
     this.address_1,
     this.city,
     this.state,
     this.postcode,
  });
  var address_1;
  var city;
  var state;
  var postcode;

  ShippingAddress.fromJson(Map<String, dynamic> json){
    address_1 = json['address_1'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_1'] = address_1;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    return _data;
  }
}