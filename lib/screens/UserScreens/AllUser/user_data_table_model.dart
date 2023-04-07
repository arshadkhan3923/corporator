class UserModel {
  UserModel({
   this.i,
   this.data,
});
  String? i="0";
 List<Data>? data;

UserModel.fromJson(Map<String, dynamic> json){
i = json['0'];
data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['0'] = 0;
  _data['data'] = data?.map((e)=>e.toJson()).toList();
  return _data;
}
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.decrypt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String? decrypt;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    decrypt = null;
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