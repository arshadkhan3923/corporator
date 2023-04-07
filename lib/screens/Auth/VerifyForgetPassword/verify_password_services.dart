import 'dart:convert';
import 'package:corporator/screens/Auth/VerifyForgetPassword/verify_password_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';

class VerifyForgetPasswordService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<VerifyPasswordModel> list = [];
  Future<bool> verifyForgetPasswordSubmitForm(final email,final code) async {
    final response = await apiService.verifyForgetPassword(
        {
          'email': email.toString(),
          'code': code.toString()
        });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());

      SharedPreferences sharedP = await SharedPreferences.getInstance();
      sharedP.setString('pass_token', map['token']);
      String? passToken = sharedP.getString('pass_token');
      print("==========Token=========");
      print("password token $passToken");
      print("======================");


      list.add(VerifyPasswordModel.fromJson(map));
      String? message = list[0].message.toString();
      print(list[0].toString());
      print("==================Role=================");
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