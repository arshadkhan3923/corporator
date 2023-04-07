import 'dart:convert';
import 'package:get/get.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../../../AppLayers/Networking/network_client.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';

class AddNewThemeService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  Future<bool> addNewThemeFormSubmit(
      final primaryColor,
      final bgColor,
      final white,
      final dGray,
      final gray,
      final text,
      final link,
      final owenId,

      ) async {
    final response = await apiService.postAddNewThemeData(
        {
          'logo_url':"IMG_20201221_145730.jpg",
          'bg': bgColor.toString(),
          'white': white.toString(),
          'D_Gray': dGray.toString(),
          'Grey': gray.toString(),
          'Text': text.toString(),
          'link': link.toString(),
          'Primary': primaryColor.toString(),
          'owner_id': owenId.toString(),
        }
    );
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      print("===========New Theme add ===========");
      print(map.toString());
      print("===========New Theme add ===========");
      return true;
    } else {
      return false;
    }
  }
}