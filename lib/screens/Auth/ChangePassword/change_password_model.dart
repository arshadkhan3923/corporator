class RestPasswordModel {
  RestPasswordModel({
    required this.success,
  });
  late final String success;

  RestPasswordModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    return _data;
  }
}