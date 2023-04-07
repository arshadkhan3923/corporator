import 'dart:convert';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'user_data_table_model.dart';


class UserDataTableService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<UserModel> list = [];
  Future<List<UserModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getUserDataTable();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(UserModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {}

    return list;
    }
}