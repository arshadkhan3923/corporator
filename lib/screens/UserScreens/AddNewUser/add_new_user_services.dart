import 'dart:convert';
import 'package:get/get.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../../../AppLayers/Networking/network_client.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';

class AddNewUserService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  Future<bool> addNewFormUserSubmit(
      final userAddress,
      final userPhoneNumber,
      final userZipCode,
      final userPurpose,
      final owenId,
      ) async {
    final response = await apiService.postNewAppUserData(
        {
          // 'logo_url':"assets/images/profile.png",
          'address': userAddress.toString(),
          'phone_no': userPhoneNumber.toString(),
          'zip_code': userZipCode.toString(),
          'purpose': userPurpose.toString(),
          'owner_id': owenId.toString(),
        }
    );
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      print("===========User add ===========");
      print(map.toString());
      print("===========User add ===========");

      return true;
    } else {
      return false;
    }
  }
}

