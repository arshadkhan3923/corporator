import 'package:dio/dio.dart';

import '../Streaming/Overseer.dart';
import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;
  ApiService({required this.networkClient});

  ///LogIn
  Future<Response> loginUser(Map<String, Object> params) {
    return networkClient.post('api/login', params);
  }
  /// Forget Password
  Future<Response> forgetPassword(Map<String, Object> params) {
    return networkClient.post('api/sendcode', params);
  }
  /// verify Forget Password
  Future<Response> verifyForgetPassword(Map<String, Object> params) {
    return networkClient.post('api/verifyPassword', params);
  }
  /// rest Password
  Future<Response> resetPassword(Map<String, Object> params) {
    return networkClient.post('api/resetPassword', params);
  }
  ///get user view
  Future<Response> getUserDataTable() {
    return networkClient.get('api/getalluser', {});
  }
  ///post new App User
  Future<Response> postNewAppUserData(Map<String, Object> params) {
    return networkClient.post('api/userinfo', params);
  }
  /// Update User
  Future<Response> postUpdateUserData(Map<String, Object> params) {
    return networkClient.post('api/update/1', params);
  }
  ///get package view
  Future<Response> getPackageDataTable() {
    return networkClient.get('api/package', {});
  }
  /// post add new package
  Future<Response> postAddNewPackage(Map<String, Object> params) {
    return networkClient.post('api/package', params);
  }
  /// post Update package
  Future<Response> postUpdatePackage(Map<String, Object> params) {
    return networkClient.post('api/package/${Overseer.updatePackageId}', params);
  }
  ///get App theme
  Future<Response> getAppThemeData() {
    return networkClient.get('api/DesktopTheme', {});
  }
  ///post Add New  theme
  Future<Response> postAddNewThemeData(Map<String, Object> params) {
    return networkClient.post('api/DesktopTheme', params);
  }
  ///post Update New theme
  Future<Response> postUpdateThemeData(Map<String, Object> params) {
    return networkClient.post('api/DesktopTheme/${Overseer.updatePackageId}', params);
  }
}
