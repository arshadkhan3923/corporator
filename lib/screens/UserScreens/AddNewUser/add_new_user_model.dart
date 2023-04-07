class AddUserModel {
  AddUserModel({
    required this.data,
    required this.message,
  });
  late final Data data;
  late final String message;

  AddUserModel.fromJson(Map<String, dynamic> json){
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
    required this.address,
    required this.phoneNo,
    required this.zipCode,
    required this.purpose,
    required this.ownerId,
    required this.userId,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String address;
  late final String phoneNo;
  late final String zipCode;
  late final String purpose;
  late final int ownerId;
  late final int userId;
  late final String id;
  late final String updatedAt;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    address = json['address'];
    phoneNo = json['phone_no'];
    zipCode = json['zip_code'];
    purpose = json['purpose'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['phone_no'] = phoneNo;
    _data['zip_code'] = zipCode;
    _data['purpose'] = purpose;
    _data['owner_id'] = ownerId;
    _data['user_id'] = userId;
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}