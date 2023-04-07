import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';
import 'change_password_model.dart';

class RestPasswordService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<RestPasswordModel> list = [];

  Future<bool> resetPasswordSubmitForm(final password) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    String? passToken = sharedP.getString('pass_token');
    final response = await apiService.resetPassword(
        {
          'token': passToken.toString(),
          'password': password.toString()
        });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());

      list.add(RestPasswordModel.fromJson(map));
      String? message = list[0].success.toString();
      print(list[0].toString());
      print("==================Change password=================");
      Get.snackbar(
        "Message",
        colorText: AppColors.whiteColors,
        backgroundColor: AppColors.secondaryColor,
        message,
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
      );
      return true;
    } else {
      return false;
    }
  }
}