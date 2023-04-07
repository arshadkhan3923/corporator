import 'dart:async';
import 'dart:io';
import 'package:corporator/screens/Auth/login/login_screen.dart';
import 'package:corporator/screens/main/Tab_update_provider.dart';
import 'package:corporator/screens/main/main_screen.dart';
import 'AppLayers/Streaming/Provider.dart'as pro;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppLayers/Streaming/Overseer.dart';
import 'controllers/MenuController.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 0), () async {
      SharedPreferences sharedP = await SharedPreferences.getInstance();
      String? userToken = sharedP.getString('access_token');
      if(userToken == null){
        Get.to(LoginScreen());
      }else{
        Get.offAll(MainScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 1040),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child){
          return pro.Provider(
            data: Overseer(),
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController2(),
                ),
                ChangeNotifierProvider(
                    create: (context) => UpdateIndex(),
                ),
              ],
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Admin Panel',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: 'Poppins',
                  textTheme: Typography.dense2021.apply(fontSizeFactor:1.sp),
                ),

                home: LoginScreen(),
              ),
            ),
          );
        }
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port)=>true;}
}