import 'package:get/get.dart';

class GerCartDetailsModel {
  GerCartDetailsModel({
     this.cartHash,
     this.cartKey,
     this.currency,
     this.customer,
     this.items,
     this.itemCount,
     this.itemsWeight,
     this.coupons,
     this.needsPayment,
     this.needsShipping,
     this.shipping,
     this.fees,
     this.taxes,
     this.totals,
     this.removedItems,
     this.crossSells,
     this.notices,
  });
  var cartHash;
  var cartKey;
 Currency? currency;
  Customer? customer;
 List<Items>? items;
  var itemCount;
  var localitemCont=0.obs;
  var itemsWeight;
List<dynamic>? coupons;
var needsPayment;
var needsShipping;
 Shipping? shipping;
  List<dynamic>? fees;
 List<dynamic>? taxes;
 Totals? totals;
 List<dynamic>? removedItems;
 List<dynamic>? crossSells;
 List<dynamic>? notices;

  GerCartDetailsModel.fromJson(Map<String, dynamic> json){
    cartHash = json['cart_hash'];
    cartKey = json['cart_key'];
    currency = Currency.fromJson(json['currency']);
    customer = Customer.fromJson(json['customer']);
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
    itemCount = json['item_count'];
    itemsWeight = json['items_weight'];
    coupons = List.castFrom<dynamic, dynamic>(json['coupons']);
    needsPayment = json['needs_payment'];
    needsShipping = json['needs_shipping'];
    shipping = Shipping.fromJson(json['shipping']);
    fees = List.castFrom<dynamic, dynamic>(json['fees']);
    taxes = List.castFrom<dynamic, dynamic>(json['taxes']);
    totals = Totals.fromJson(json['totals']);
    removedItems = List.castFrom<dynamic, dynamic>(json['removed_items']);
    crossSells = List.castFrom<dynamic, dynamic>(json['cross_sells']);
    notices = List.castFrom<dynamic, dynamic>(json['notices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart_hash'] = cartHash;
    _data['cart_key'] = cartKey;
    _data['currency'] = currency!.toJson();
    _data['customer'] = customer!.toJson();
    _data['items'] = items!.map((e)=>e.toJson()).toList();
    _data['item_count'] = itemCount;
    _data['items_weight'] = itemsWeight;
    _data['coupons'] = coupons;
    _data['needs_payment'] = needsPayment;
    _data['needs_shipping'] = needsShipping;
    _data['shipping'] = shipping!.toJson();
    _data['fees'] = fees;
    _data['taxes'] = taxes;
    _data['totals'] = totals!.toJson();
    _data['removed_items'] = removedItems;
    _data['cross_sells'] = crossSells;
    _data['notices'] = notices;
    return _data;
  }
}

class Currency {
  Currency({
     this.currencyCode,
     this.currencySymbol,
     this.currencyMinorUnit,
     this.currencyDecimalSeparator,
     this.currencyThousandSeparator,
     this.currencyPrefix,
     this.currencySuffix,
  });
  var currencyCode;
  var currencySymbol;
  var currencyMinorUnit;
  var currencyDecimalSeparator;
  var currencyThousandSeparator;
  var currencyPrefix;
  var currencySuffix;

  Currency.fromJson(Map<String, dynamic> json){
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyMinorUnit = json['currency_minor_unit'];
    currencyDecimalSeparator = json['currency_decimal_separator'];
    currencyThousandSeparator = json['currency_thousand_separator'];
    currencyPrefix = json['currency_prefix'];
    currencySuffix = json['currency_suffix'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currency_code'] = currencyCode;
    _data['currency_symbol'] = currencySymbol;
    _data['currency_minor_unit'] = currencyMinorUnit;
    _data['currency_decimal_separator'] = currencyDecimalSeparator;
    _data['currency_thousand_separator'] = currencyThousandSeparator;
    _data['currency_prefix'] = currencyPrefix;
    _data['currency_suffix'] = currencySuffix;
    return _data;
  }
}

class Customer {
  Customer({
     this.billingAddress,
     this.shippingAddress,
  });
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;

  Customer.fromJson(Map<String, dynamic> json){
    billingAddress = BillingAddress.fromJson(json['billing_address']);
    shippingAddress = ShippingAddress.fromJson(json['shipping_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['billing_address'] = billingAddress!.toJson();
    _data['shipping_address'] = shippingAddress!.toJson();
    return _data;
  }
}

class BillingAddress {
  BillingAddress({
     this.billingFirstName,
     this.billingLastName,
     this.billingCompany,
     this.billingCountry,
     this.billingAddress_1,
     this.billingAddress_2,
     this.billingCity,
     this.billingState,
     this.billingPostcode,
     this.billingPhone,
     this.billingEmail,
     this.b2bkingJsBasedInvalid,
  });
  var billingFirstName;
  var billingLastName;
  var billingCompany;
  var billingCountry;
  var billingAddress_1;
  var billingAddress_2;
  var billingCity;
  var billingState;
  var billingPostcode;
  var billingPhone;
  var billingEmail;
  var b2bkingJsBasedInvalid;

  BillingAddress.fromJson(Map<String, dynamic> json){
    billingFirstName = json['billing_first_name'];
    billingLastName = json['billing_last_name'];
    billingCompany = json['billing_company'];
    billingCountry = json['billing_country'];
    billingAddress_1 = json['billing_address_1'];
    billingAddress_2 = json['billing_address_2'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingPostcode = json['billing_postcode'];
    billingPhone = json['billing_phone'];
    billingEmail = json['billing_email'];
    b2bkingJsBasedInvalid = json['b2bking_js_based_invalid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['billing_first_name'] = billingFirstName;
    _data['billing_last_name'] = billingLastName;
    _data['billing_company'] = billingCompany;
    _data['billing_country'] = billingCountry;
    _data['billing_address_1'] = billingAddress_1;
    _data['billing_address_2'] = billingAddress_2;
    _data['billing_city'] = billingCity;
    _data['billing_state'] = billingState;
    _data['billing_postcode'] = billingPostcode;
    _data['billing_phone'] = billingPhone;
    _data['billing_email'] = billingEmail;
    _data['b2bking_js_based_invalid'] = b2bkingJsBasedInvalid;
    return _data;
  }
}

class ShippingAddress {
  ShippingAddress({
     this.shippingFirstName,
     this.shippingLastName,
     this.shippingCompany,
     this.shippingCountry,
     this.shippingAddress_1,
     this.shippingAddress_2,
     this.shippingCity,
     this.shippingState,
     this.shippingPostcode,
  });
  var shippingFirstName;
  var shippingLastName;
  var shippingCompany;
  var shippingCountry;
  var shippingAddress_1;
  var shippingAddress_2;
  var shippingCity;
  var shippingState;
  var shippingPostcode;

  ShippingAddress.fromJson(Map<String, dynamic> json){
    shippingFirstName = json['shipping_first_name'];
    shippingLastName = json['shipping_last_name'];
    shippingCompany = json['shipping_company'];
    shippingCountry = json['shipping_country'];
    shippingAddress_1 = json['shipping_address_1'];
    shippingAddress_2 = json['shipping_address_2'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingPostcode = json['shipping_postcode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['shipping_first_name'] = shippingFirstName;
    _data['shipping_last_name'] = shippingLastName;
    _data['shipping_company'] = shippingCompany;
    _data['shipping_country'] = shippingCountry;
    _data['shipping_address_1'] = shippingAddress_1;
    _data['shipping_address_2'] = shippingAddress_2;
    _data['shipping_city'] = shippingCity;
    _data['shipping_state'] = shippingState;
    _data['shipping_postcode'] = shippingPostcode;
    return _data;
  }
}

class Items {
  Items({
     this.itemKey,
     this.id,
     this.name,
     this.title,
     this.price,
     this.quantity,
     this.totals,
     this.slug,
     this.meta,
     this.backorders,
     this.cartItemData,
     this.featuredImage,
  });
  var itemKey;
  var id;
  var name;
  var title;
  var price;
  Quantity ?quantity;
  Totals? totals;
  var slug;
  Meta ? meta;
  var backorders;
   List<dynamic> ? cartItemData;
  var featuredImage;
  int updatedCount=1;
  bool check=false;

  Items.fromJson(Map<String, dynamic> json){
    itemKey = json['item_key'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    price = json['price'];
    quantity = Quantity.fromJson(json['quantity']);
    totals = Totals.fromJson(json['totals']);
    slug = json['slug'];
    meta = Meta.fromJson(json['meta']);
    backorders = json['backorders'];
    cartItemData = List.castFrom<dynamic, dynamic>(json['cart_item_data']);
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item_key'] = itemKey;
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['price'] = price;
    _data['quantity'] = quantity!.toJson();
    _data['totals'] = totals!.toJson();
    _data['slug'] = slug;
    _data['meta'] = meta!.toJson();
    _data['backorders'] = backorders;
    _data['cart_item_data'] = cartItemData;
    _data['featured_image'] = featuredImage;
    return _data;
  }
}

class Quantity {
  Quantity({
     this.value,
     this.minPurchase,
     this.maxPurchase,
  });
  var value;
  var minPurchase;
  var maxPurchase;
  var quantity=0.obs;


  Quantity.fromJson(Map<String, dynamic> json){
    value = json['value'];
    minPurchase = json['min_purchase'];
    maxPurchase = json['max_purchase'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['min_purchase'] = minPurchase;
    _data['max_purchase'] = maxPurchase;
    return _data;
  }
}

class Totals {
  Totals({
     this.subtotal,
     this.subtotalTax,
     this.total,
     this.tax,
  });
  var subtotal;
  var subtotalTax;
  var total;
  var tax;
  var localTotal=0.obs;

  Totals.fromJson(Map<String, dynamic> json){
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subtotal'] = subtotal;
    _data['subtotal_tax'] = subtotalTax;
    _data['total'] = total;
    _data['tax'] = tax;
    return _data;
  }
}

class Meta {
  Meta({
     this.productType,
     this.sku,
     this.dimensions,
     this.weight,
     this.variation,
  });
  var productType;
  var sku;
   Dimensions? dimensions;
  var weight;
   List<dynamic>? variation;

  Meta.fromJson(Map<String, dynamic> json){
    productType = json['product_type'];
    sku = json['sku'];
    dimensions = Dimensions.fromJson(json['dimensions']);
    weight = json['weight'];
    variation = List.castFrom<dynamic, dynamic>(json['variation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_type'] = productType;
    _data['sku'] = sku;
    _data['dimensions'] = dimensions!.toJson();
    _data['weight'] = weight;
    _data['variation'] = variation;
    return _data;
  }
}

class Dimensions {
  Dimensions({
     this.length,
     this.width,
     this.height,
     this.unit,
  });
  var length;
  var width;
  var height;
  var unit;

  Dimensions.fromJson(Map<String, dynamic> json){
    length = json['length'];
    width = json['width'];
    height = json['height'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['length'] = length;
    _data['width'] = width;
    _data['height'] = height;
    _data['unit'] = unit;
    return _data;
  }
}

class Shipping {
  Shipping({
     this.totalPackages,
     this.showPackageDetails,
     this.hasCalculatedShipping,
    //  this.packages,
  });
  var totalPackages;
var showPackageDetails;
var hasCalculatedShipping;
  // late final Packages packages;

  Shipping.fromJson(Map<String, dynamic> json){
    totalPackages = json['total_packages'];
    showPackageDetails = json['show_package_details'];
    hasCalculatedShipping = json['has_calculated_shipping'];
    // packages = Packages.fromJson(json['packages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_packages'] = totalPackages;
    _data['show_package_details'] = showPackageDetails;
    _data['has_calculated_shipping'] = hasCalculatedShipping;
    // _data['packages'] = packages.toJson();
    return _data;
  }
}

// class Packages {
//   Packages({
//    this.default,
// });
// late final Default default;
//
// Packages.fromJson(Map<String, dynamic> json){
// default = Default.fromJson(json['default']);
// }
//
// Map<String, dynamic> toJson() {
// final _data = <String, dynamic>{};
// _data['default'] = default.toJson();
// return _data;
// }
// }

class Default {
Default({
 this.packageName,
 this.rates,
 this.packageDetails,
 this.index,
 this.chosenMethod,
 this.formattedDestination,
});
var packageName;
 Rates? rates;
var packageDetails;
var index;
var chosenMethod;
var formattedDestination;

Default.fromJson(Map<String, dynamic> json){
packageName = json['package_name'];
rates = Rates.fromJson(json['rates']);
packageDetails = json['package_details'];
index = json['index'];
chosenMethod = json['chosen_method'];
formattedDestination = json['formatted_destination'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['package_name'] = packageName;
_data['rates'] = rates!.toJson();
_data['package_details'] = packageDetails;
_data['index'] = index;
_data['chosen_method'] = chosenMethod;
_data['formatted_destination'] = formattedDestination;
return _data;
}
}

class Rates {
Rates({
 this.freeShipping1,
});
 FreeShipping1? freeShipping1;

Rates.fromJson(Map<String, dynamic> json){
freeShipping1 = FreeShipping1.fromJson(json['free_shipping:1']);
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['free_shipping:1'] = freeShipping1!.toJson();
return _data;
}
}

class FreeShipping1 {
FreeShipping1({
 this.key,
 this.methodId,
 this.instanceId,
 this.label,
 this.cost,
 this.html,
 this.taxes,
 this.chosenMethod,
 this.metaData,
});
var key;
var methodId;
var instanceId;
var label;
var cost;
var html;
var taxes;
var chosenMethod;
 MetaData? metaData;

FreeShipping1.fromJson(Map<String, dynamic> json){
key = json['key'];
methodId = json['method_id'];
instanceId = json['instance_id'];
label = json['label'];
cost = json['cost'];
html = json['html'];
taxes = json['taxes'];
chosenMethod = json['chosen_method'];
metaData = MetaData.fromJson(json['meta_data']);
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['key'] = key;
_data['method_id'] = methodId;
_data['instance_id'] = instanceId;
_data['label'] = label;
_data['cost'] = cost;
_data['html'] = html;
_data['taxes'] = taxes;
_data['chosen_method'] = chosenMethod;
_data['meta_data'] = metaData!.toJson();
return _data;
}
}

class MetaData {
MetaData({
 this.items,
});
var items;

MetaData.fromJson(Map<String, dynamic> json){
items = json['items'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['items'] = items;
return _data;
}
}