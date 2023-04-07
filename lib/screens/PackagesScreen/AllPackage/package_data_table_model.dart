class ViewPackageModel {
  ViewPackageModel({
    required this.data,
    required this.message,
  });
  late final List<Data> data;
  late final String message;

  ViewPackageModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.quota,
    required this.ownerId,
    required this.price,
    required this.type,
    required this.duration,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String quota;
  late final String ownerId;
  late final String price;
  late final String type;
  late final String duration;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    quota = json['quota'];
    ownerId = json['owner_id'];
    price = json['price'];
    type = json['type'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['quota'] = quota;
    _data['owner_id'] = ownerId;
    _data['price'] = price;
    _data['type'] = type;
    _data['duration'] = duration;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}