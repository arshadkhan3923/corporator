import 'dart:convert';
import 'package:corporator/screens/PackagesScreen/UpdatePackage/update_package_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';

class UpdatePackageService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<UpdatePackageModel> list = [];

  Future<bool> updatePackageSubmitForm(
      final name,
      final quota,
      final price,
      final duration,
      ) async {
    final response = await apiService.postUpdatePackage(
        {
          'name': name.toString(),
          'quota': quota.toString(),
          'price': price.toString(),
          'duration': duration.toString(),
        });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      list.add(UpdatePackageModel.fromJson(map));
      String? message = list[0].message.toString();
        print(list[0].toString());
        print("==================Update Package=================");

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
