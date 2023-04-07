class AppThemeModel {
  AppThemeModel({
    required this.data,
    required this.message,
  });
  late final List<Data> data;
  late final String message;

  AppThemeModel.fromJson(Map<String, dynamic> json){
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
    required this.bg,
    required this.white,
    required this.DGray,
    required this.Grey,
    required this.Text,
    required this.link,
    required this.Primary,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String logoUrl;
  late final String bg;
  late final String white;
  late final String DGray;
  late final String Grey;
  late final String Text;
  late final String link;
  late final String Primary;
  late final String ownerId;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    logoUrl = json['logo_url'];
    bg = json['bg'];
    white = json['white'];
    DGray = json['D_Gray'];
    Grey = json['Grey'];
    Text = json['Text'];
    link = json['link'];
    Primary = json['Primary'];
    ownerId = json['owner_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['logo_url'] = logoUrl;
    _data['bg'] = bg;
    _data['white'] = white;
    _data['D_Gray'] = DGray;
    _data['Grey'] = Grey;
    _data['Text'] = Text;
    _data['link'] = link;
    _data['Primary'] = Primary;
    _data['owner_id'] = ownerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}