


import 'dart:convert';

import 'package:get/get.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'app_theme_data_table_model.dart';

class AppThemeService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<AppThemeModel> list = [];
  Future<List<AppThemeModel>> browse() async {
    print("***************Response**************************");
    final response = await apiService.getAppThemeData();
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("***************APi Response**************************");
      list.add(AppThemeModel.fromJson(map));
      /// print Response Api
      print(response.toString());
      print("***************APi Response**************************");
    } else {}

    return list;
  }
}