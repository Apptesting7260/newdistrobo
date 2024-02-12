class ShopModel {
  ShopModel({
     this.data,

  });
 List<Data> ? data;


  ShopModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
     this.id,
     this.img,
     this.name,
    this.categoryStatus
  });
  var id;
  var img;
  var name;
  var categoryStatus;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    img = json['img'];
    name = json['name'];
    categoryStatus = json['category_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['img'] = img;
    _data['name'] = name;
    _data['category_status'] = categoryStatus;
    return _data;
  }
}