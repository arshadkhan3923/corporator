import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';
import 'login_model.dart';

class LoginFormService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<LoginModel> list = [];

  Future<bool> loginSubmitForm(final phone, final password) async {
    final response = await apiService.loginUser(
        {'email': phone.toString(), 'password': password.toString()});
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());

      SharedPreferences sharedP = await SharedPreferences.getInstance();
      sharedP.setString('access_token', map['access_token']);
      String? userToken = sharedP.getString('access_token');
      print("==========Token=========");
      print("User token $userToken");
      print("======================");
      list.add(LoginModel.fromJson(map));
      String? message = list[0].message.toString();
      print(list[0].toString());
      print("==================Role=================");

      Get.snackbar(
        "Congratulation",
        colorText: AppColors.whiteColors,
        backgroundColor: Colors.orangeAccent,
        message,
        icon: const Icon(Icons.error_outline,
            color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
      return true;
    } else {
      return false;
    }
  }
}
