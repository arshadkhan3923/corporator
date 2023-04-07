class AppNewThemeModel {
  AppNewThemeModel({
    required this.status,
    required this.data,
    required this.message,
  });
  late final String status;
  late final Data data;
  late final String message;

  AppNewThemeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.bg,
    required this.white,
    required this.DGray,
    required this.Grey,
    required this.Text,
    required this.link,
    required this.Primary,
    required this.ownerId,
    required this.logoUrl,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String bg;
  late final String white;
  late final String DGray;
  late final String Grey;
  late final String Text;
  late final String link;
  late final String Primary;
  late final String ownerId;
  late final String logoUrl;
  late final String id;
  late final String updatedAt;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    bg = json['bg'];
    white = json['white'];
    DGray = json['D_Gray'];
    Grey = json['Grey'];
    Text = json['Text'];
    link = json['link'];
    Primary = json['Primary'];
    ownerId = json['owner_id'];
    logoUrl = json['logo_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bg'] = bg;
    _data['white'] = white;
    _data['D_Gray'] = DGray;
    _data['Grey'] = Grey;
    _data['Text'] = Text;
    _data['link'] = link;
    _data['Primary'] = Primary;
    _data['owner_id'] = ownerId;
    _data['logo_url'] = logoUrl;
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}