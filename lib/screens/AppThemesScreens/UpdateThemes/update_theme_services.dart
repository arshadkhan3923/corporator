import 'dart:convert';
import 'package:corporator/AppLayers/Networking/network_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';
import 'update_theme_model.dart';

class UpdateThemeService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<UpdateThemeModel> list = [];

  Future<bool> updateThemeSubmitForm(
      final bgColor,
      final white,
      final dGray,
      final gray,
      final text,
      final link,
      final primaryColor,
      final owenId,
      ) async {
    final response = await apiService.postUpdateThemeData(
        {
          'bg': bgColor.toString(),
          'white': white.toString(),
          'D_Gray': dGray.toString(),
          'Grey': gray.toString(),
          'Text': text.toString(),
          'link': link.toString(),
          'Primary': primaryColor.toString(),
          'owner_id': owenId.toString(),
        });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());

      list.add(UpdateThemeModel.fromJson(map));
      String? message = list[0].message.toString();
      if (kDebugMode) {
        print(list[0].toString());
      }
      if (kDebugMode) {
        print("==================Update Package=================");
      }

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