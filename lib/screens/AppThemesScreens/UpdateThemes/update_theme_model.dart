class UpdateThemeModel {
  UpdateThemeModel({
    required this.data,
    required this.message,
  });
  late final List<Data> data;
  late final String message;

  UpdateThemeModel.fromJson(Map<String, dynamic> json){
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
    required this.logoUrl,
    required this.primaryColor,
    required this.secondaryColor,
    required this.title,
    this.otherColorScheme,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String logoUrl;
  late final String primaryColor;
  late final String secondaryColor;
  late final String title;
  late final String? otherColorScheme;
  late final String ownerId;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    logoUrl = json['logo_url'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    title = json['title'];
    otherColorScheme = null;
    ownerId = json['owner_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['logo_url'] = logoUrl;
    _data['primary_color'] = primaryColor;
    _data['secondary_color'] = secondaryColor;
    _data['title'] = title;
    _data['otherColorScheme'] = otherColorScheme;
    _data['owner_id'] = ownerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
