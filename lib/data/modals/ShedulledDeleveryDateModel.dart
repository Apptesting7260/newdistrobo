class ShedulDeleveryDateModel {
  ShedulDeleveryDateModel({
     this.message,
     this.data,
  });
 String? message;
   List<String>? data;

  ShedulDeleveryDateModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = json['data']==null?[]:List.castFrom<dynamic, String>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}