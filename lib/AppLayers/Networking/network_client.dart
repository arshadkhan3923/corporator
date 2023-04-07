import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/app_colors.dart';
import '../Streaming/Overseer.dart';
import 'exceptions.dart';

class NetworkClient {
  Dio _dio = Dio();
  String baseUrl = 'https://learnunstoppable.com/fileshare/';

  NetworkClient() {
    BaseOptions baseOptions = BaseOptions(
      // receiveTimeout: 20000,
      // connectTimeout: 15000,
      baseUrl: baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
     ),
    );
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, Map<String, Object> params) async {
    Response response;

    try {
      response = await _dio.get(url,
          queryParameters: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
           // "Authorization": "Bearer ${userToken}"
          }));

    } on DioError catch (exception) {

      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> post(String url, Map<String, Object> params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();

    String? userToken = sharedP.getString('access_token');

    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            // "Accept": "application/json",
            // "Content-Type": "application/json",
            "Authorization": "Bearer $userToken"
          }));
      print("token network client == ${userToken}");
      // String? role =
      //     response.data.toString().split('role').last.substring(0, 8);
      // SharedPreferences shared = await SharedPreferences.getInstance();
      // String? roles = shared.get(role) as String;
      // print("role adnan $roles");
    } on DioError catch (exception) {
      String? message =
          exception.response?.data.toString().split('message:').last;
      print("adnan  ${message!}");
      Get.snackbar(
        "Error",
        backgroundColor: AppColors.blackColors,
        "${message.toString()}",
        icon: const Icon(Icons.error_outline, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );

      throw RemoteException(dioError: exception);
    }
    return response;
    }

  // for HTTP.POST Request.
  Future<Response> addNewPost(String url, var params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    String? userToken = sharedP.getString('userLogin');
    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            // "Content-Type": "application/json",
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $userToken"
          }));
    } on DioError catch (exception) {
      String content = exception.response.toString();
      print("============${content}==========Network client exception ==" + exception.message.toString());
      print('login method api sevice3 ${DateTime.now().second}');
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> forGotPassword(
      String url, Map<String, Object> params) async {
    Response response;

    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          }));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.PATCH Request.
  Future<Response> patch(String url, Map<String, Object> params) async {
    Response response;
    try {
      response = await _dio.patch(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for dwonload Request.
  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }
}
