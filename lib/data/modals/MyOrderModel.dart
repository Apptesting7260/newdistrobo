class MyOrderModel {
  MyOrderModel({
     this.orderDetails,
  });
List<OrderDetails>? orderDetails;

  MyOrderModel.fromJson(Map<String, dynamic> json){
    orderDetails = List.from(json['order_details']).map((e)=>OrderDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order_details'] = orderDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class OrderDetails {
  OrderDetails({
     this.ItemName,
     this.ItemTitle,
     this.ItemQuantity,
     this.Name,
     this.ID,
     this.Value,
     this.OrderStatus,
  });
  var ItemName;
  var ItemTitle;
var ItemQuantity;
  var Name;
  var ID;
  var Value;
  var OrderStatus;

  OrderDetails.fromJson(Map<String, dynamic> json){
    ItemName = json['Item_Name'];
    ItemTitle = json['Item_Title'];
    ItemQuantity = json['Item_Quantity'];
    Name = json['Name'];
    ID = json['ID'];
    Value = json['Value'];
    OrderStatus = json['Order_Status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Item_Name'] = ItemName;
    _data['Item_Title'] = ItemTitle;
    _data['Item_Quantity'] = ItemQuantity;
    _data['Name'] = Name;
    _data['ID'] = ID;
    _data['Value'] = Value;
    _data['Order_Status'] = OrderStatus;
    return _data;
  }
}