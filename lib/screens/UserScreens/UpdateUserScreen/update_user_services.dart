import 'dart:convert';
import 'package:corporator/screens/UserScreens/UpdateUserScreen/update_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../utils/app_colors.dart';

class UpdateUserService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<UpdateUserModel> list = [];

  Future<bool> updateUserSubmitForm(
      final name,
      final email,
      final password,
      final role,
      ) async {
    final response = await apiService.postUpdateUserData(
        {
          'name': name.toString(),
          'email': email.toString(),
          'password': password.toString(),
          'role': role.toString(),

        });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());


      list.add(UpdateUserModel.fromJson(map));
      String? message = list[0].data.toString();
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



//
//
//
//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// import 'package:http/http.dart' as http;
//
// import '../../../AppLayers/Streaming/Overseer.dart';
// class UpdateUserService{
//   Future<bool> UpdateUser(name ,email,passowrd,role,id
//       ) async {
// print("${name}========================${email}==================${id}");
//     final prefs = await SharedPreferences.getInstance();
//     String? userToken;
//
//
//
//     if (prefs.getString("userToken") != null) {
//       userToken = prefs.getString("access_token");
//
//     }
//
//     var headers = {
//
//       'Accept': 'application/json',
//       'Access-Control-Allow-Origin': '*',
//       "Content-Type": "application/json",
//       'Authorization': "Bearer ${userToken}",
//       'Content-Type': 'application/json; charset=UTF-8',
//     };
//
//     var request = http.MultipartRequest('POST', Uri.parse('https://learnunstoppable.com/fileshare/api/update/${id}'));
//     request.fields.addAll({
//       'name':  name.toString(),
//       'email':  email.toString(),
//       'password':  passowrd.toString(),
//       'role':  role.toString(),
//       });
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       var geer = await http.Response.fromStream(response);
//       Map<String, dynamic> map = jsonDecode(geer.body);
//       List<dynamic> list = [];
//       list.add(map);
//
//       if(list[0]['token_type']=='Bearer'){
//         Overseer.loading=false;
//         print("==================services======${Overseer.loading}");
//         Get.snackbar(
//             "Successfully",
//             "User Added",
//             dismissDirection: DismissDirection.horizontal,
//             isDismissible: true,
//             backgroundColor: Colors.orange,
//             duration: const Duration(seconds: 2),
//             icon: const Icon(  Icons.check_circle_outline,
//                 color: Colors.green)
//         );
//
//         // Future.delayed(const Duration(milliseconds: 100), () {
//         //   print("object");
//         //   dialogBuilder(context);
//         //
//         // });
//         // Get.back();
//
//
//         // Get.to(Bottom_bar(selectedIndex: 0,));
//       }
//       else {
//         Overseer.loading=false;
//         Get.snackbar(
//           "Error",
//           "Some Thing Went Wrong",
//           dismissDirection: DismissDirection.horizontal,
//           isDismissible: true,
//           backgroundColor: Colors.yellow,
//           duration: Duration(seconds: 2),
//           icon: Icon(Icons.error_outline, color: Colors.red),
//         );
//       }
//       print("==============${geer.body}");
//       return true;//AddInventoryModel.fromJson(jsonDecode(geer.body));
//     } else {
//       Overseer.loading=false;
//       Overseer.errorMessage='';
//       Overseer.errorMessage = 'ERROR';
//       Get.snackbar(
//         "Network Error",
//         "${Overseer.errorMessage}",
//         dismissDirection: DismissDirection.horizontal,
//         isDismissible: true,
//         backgroundColor: Colors.yellow,
//         duration: Duration(seconds: 2),
//       );
//       //throw Exception('Failed to create album.');
//       return false;
//     }
//   }
//
//
//
// }
//
//
//
//
//
//
// // import 'dart:convert';
// //
// // import 'package:asasa_estate/Bottom_bar.dart';
// // import 'package:dio/dio.dart' as http_dio;
// // import 'package:dio/dio.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import '../../../AppLayer/Networking/apis_services.dart';
// // import '../../../AppLayer/Networking/network_client.dart';
// // import '../../../AppLayer/Streaming/Overseer.dart';
// // import '../../../AppLayer/Streaming/appColors.dart';
// //
// //
// //
// // class EnterInventoryFormService {
// //   http_dio.Dio dio = http_dio.Dio();
// //   late ApiService apiService =
// //   ApiService(networkClient: Get.put(NetworkClient()));
// //   //List<LogInModel> logInData = [];
// //
// //   Future<bool> NewInventorySubmitForm(
// //
// //
// //       final client_name,
// //       final agency_name,
// //       final item_condition,
// //       final orientation,
// //       final sector,
// //       final street_number,
// //       final client_mobile,
// //       final category,
// //       final size_unit,
// //       final area_phase_id,
// //       final area_id,
// //       final plot_type,
// //       final property_type,
// //       final status,
// //       final price,
// //       final size,
// //       final extras,
// //       final plot_number,
// //
// //
// //       ) async {
// //
// //     final response;
// //     final prefs = await SharedPreferences.getInstance();
// //     String? userid=prefs.getString("userId");
// //
// //     try {
// //       response = await apiService.newinventory(
// //           {
// //             'user_id': userid.toString(),
// //             'client_name': client_name.toString(),
// //             'agency_name': agency_name.toString(),
// //             'item_condition': item_condition.toString(),
// //             'orientation': orientation.toString(),
// //             'sector': sector.toString(),
// //             'street_number': street_number.toString(),
// //             'client_mobile': client_mobile.toString(),
// //             'category': category.toString(),
// //             'size_unit': size_unit.toString(),
// //             'area_phase_id': area_phase_id.toString(),
// //             'area_id': area_id.toString(),
// //             'plot_type': plot_type.toString(),
// //             'property_type': property_type.toString(),
// //             'status': status.toString(),
// //             'price': price.toString(),
// //             'size': size.toString(),
// //             'extras': extras.toString(),
// //             'plot_number': plot_number.toString(),});
// //       if (response.statusCode == 200) {
// //
// //         Map<String, dynamic> map = jsonDecode(response.toString());
// //         print("===============${map}");
// //         if(map['success'] !=false){
// //           print("########################## ${response.statusCode} #####################################");
// //          // logInData.clear();
// //           //prefs.clear();
// //
// //           //logInData.add(LogInModel.fromJson(map));
// //
// //
// //           Overseer.errorMessage = 'Success';
// //
// //
// //
// //           print(
// //               "=======================Login 200 responce if ======================");
// //           return true;
// //         }
// //         else {
// //           Overseer.errorMessage = '${response.toString()}';
// //           print("============Login 200 responce else ==================${response?.statusCode}");
// //
// //
// //
// //           return false;
// //         }
// //
// //       }
// //       else{return false;}
// //     }
// //     catch (error) {
// //
// //       String content = error.toString();
// //       print("===========${content}exception else error =======${error.toString()}==========");
// //       Overseer.errorMessage = error.toString();
// //       Get.snackbar(
// //         "Network Error",
// //         "${Overseer.errorMessage}",
// //         dismissDirection: DismissDirection.horizontal,
// //         isDismissible: true,
// //         backgroundColor: MyAppColors.orangcolors,
// //         duration: Duration(seconds: 2),
// //       );
// //       print("Please Internet Connection");
// //       return false;
// //     }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //     on http_dio.DioError catch (ex) {
// //       print(ex.error.toString());
// //       if (ex.type == http_dio.DioErrorType.response) {
// //         //404, 400, 500
// //         if (ex.response?.statusCode == 404) {
// //           //give warning here
// //           return false;
// //         }
// //       } else if (ex.type == http_dio. DioErrorType.other) {
// //         throw Exception(ex.error.message);
// //       } else {
// //         //timeout and canceled
// //         return false;
// //       }
// //       return false;
// //     }
// //
// //
// //
// //
// //
// //
// //
// //     on http_dio.DioError catch (exception) {
// //       String content = exception.response.toString();
// //       if(exception.response?.statusCode == 404){
// //         Overseer.errorMessage = '${exception.response?.statusCode}';
// //         print("============content==================${exception.response?.statusCode}");
// //         Get.snackbar(
// //           "User Not Found",
// //           " please check",
// //           dismissDirection: DismissDirection.horizontal,
// //           isDismissible: true,
// //           backgroundColor: MyAppColors.yellowcolor,
// //           duration: Duration(seconds: 2),
// //           icon: Icon(Icons.error_outline, color: Colors.red),
// //         );
// //         Overseer.errorMessage = 'User Not Found';
// //         Overseer.login_status = "User Not Found";
// //         Overseer.is_user_valid = false;
// //       }else{
// //         print("===========exception else error =======${content}==========");
// //
// //       }
// //       return false;
// //       // throw Exception(exception.message);
// //       // throw RemoteException(dioError: exception);
// //     }
// //
// //
// //
// //
// //
// //     //  catch (error) {
// //     //
// //     // String content = error.toString();
// //     //    print("===========${content}exception else error =======${error.toString()}==========");
// //     //    Overseer.errorMessage = error.toString();
// //     //    Get.snackbar(
// //     //      "Error",
// //     //      "${Overseer.errorMessage}",
// //     //      dismissDirection: DismissDirection.horizontal,
// //     //      isDismissible: true,
// //     //      backgroundColor: MyAppColors.orangcolors,
// //     //      duration: Duration(seconds: 2),
// //     //    );
// //     //    print("NoSuchMethodError caught Error  ${NoSuchMethodError}");
// //     //    return false;
// //     //  }
// //   }
// // }