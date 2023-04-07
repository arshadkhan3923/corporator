import 'dart:convert';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'package_data_table_model.dart';


class ViewPackageService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<ViewPackageModel> list = [];
  Future<List<ViewPackageModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getPackageDataTable();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(ViewPackageModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {}

    return list;
    }
}