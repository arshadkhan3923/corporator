import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';
import 'forget_password_model.dart';

class ForgetPasswordService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<ForgetPasswordModel> list = [];
  Future<bool> forgetPasswordSubmitForm(final email) async {
    final response = await apiService.forgetPassword(
        {'email': email.toString()});
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      list.add(ForgetPasswordModel.fromJson(map));
      String? message = list[0].message.toString();
      print(list[0].toString());
      print("==================Forget Password=================");

      Get.snackbar(
        "Message",
        colorText: AppColors.whiteColors,
        backgroundColor: AppColors.secondaryColor,
        message,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
      return true;
    } else {
      return false;
    }
  }
}