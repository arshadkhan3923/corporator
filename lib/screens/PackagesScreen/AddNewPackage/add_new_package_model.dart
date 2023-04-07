class AddNewPackageModel {
  AddNewPackageModel({
    required this.data,
    required this.message,
  });
  late final Data data;
  late final String message;

  AddNewPackageModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.quota,
    required this.duration,
    required this.price,
    required this.ownerId,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String name;
  late final String quota;
  late final String duration;
  late final String price;
  late final int ownerId;
  late final String id;
  late final String updatedAt;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    quota = json['quota'];
    duration = json['duration'];
    price = json['price'];
    ownerId = json['owner_id'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['quota'] = quota;
    _data['duration'] = duration;
    _data['price'] = price;
    _data['owner_id'] = ownerId;
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}