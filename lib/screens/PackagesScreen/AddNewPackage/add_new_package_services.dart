import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';
import 'add_new_package_model.dart';

class AddNewPackageService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<AddNewPackageModel> list = [];
  Future<bool> addNewFormPackageSubmit(
      final name,
      final quota,
      final price,
      final duration,
      final owenId,
      ) async {
    final response = await apiService.postAddNewPackage(
        {
          'name': name.toString(),
          'quota': quota.toString(),
          'price': price.toString(),
          'duration': duration.toString(),
          'owner_id': owenId.toString(),
        }
    );
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      if (kDebugMode) {
        print("===========Package Api===========");
      }
      list.add(AddNewPackageModel.fromJson(map));
      String? message = list[0].message.toString();
      if (kDebugMode) {
        print(list[0].toString());
      }
      if (kDebugMode) {
        print("==================Package=================");
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
