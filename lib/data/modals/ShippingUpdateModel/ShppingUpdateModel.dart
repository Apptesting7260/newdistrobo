class ShippingDressUpdateModel {
  ShippingDressUpdateModel({
     this.status,
     this.userId,
  });
   String? status;
   String? userId;

  ShippingDressUpdateModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['user_id'] = userId;
    return _data;
  }
}