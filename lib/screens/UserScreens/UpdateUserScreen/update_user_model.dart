class UpdateUserModel {
  UpdateUserModel({
    required this.data,
    required this.accessToken,
    required this.tokenType,
  });
  late final Data data;
  late final String accessToken;
  late final String tokenType;

  UpdateUserModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.decrypt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String decrypt;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    decrypt = json['decrypt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['decrypt'] = decrypt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}