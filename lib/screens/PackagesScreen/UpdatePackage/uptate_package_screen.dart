import 'package:corporator/screens/PackagesScreen/UpdatePackage/update_package_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';
import '../../UserScreens/UpdateUserScreen/update_user_services.dart';

class UpdatePackageScreen extends StatefulWidget {
  String id;
  String? name;
  String? quota;
  String? price;
  String? duration;
  UpdatePackageScreen({Key? key,
    required this.id,
     this.name,
     this.quota,
     this.price,
     this.duration
  }) : super(key: key);

  @override
  State<UpdatePackageScreen> createState() => _UpdatePackageScreenState();
}

class _UpdatePackageScreenState extends State<UpdatePackageScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quotaController = TextEditingController();
  final priceController = TextEditingController();
  final durationController = TextEditingController();
  UpdateUserService ups=UpdateUserService();

  @override
  void initState() {
    nameController.text= widget.name!;
    quotaController.text= widget.quota!;
    priceController.text= widget.price!;
    durationController.text= widget.duration!;
    super.initState();
  }
  @override
  void dispose() {
    nameController.dispose();
    quotaController.dispose();
    priceController.dispose();
    durationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    UpdatePackageManager updatePackageManager = Provider.of(context).fetch(UpdatePackageManager);
    updatePackageManager.inName.add(widget.name!);
    updatePackageManager.inQuota.add(widget.quota!);
    updatePackageManager.inPrice.add(widget.price!);
    updatePackageManager.inDuration.add(widget.duration!);
    return Form(
      key: _formKey,
      child: InkWell(
        onTap: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                backgroundColor: Colors.white,
                title: const DashboardBigTextWidgets(title:'Edit Package',),
                content: SizedBox(
                  height: 500.h,
                  width: 300.w,
                  child: Column(
                    children:   [
                      SizedBox(height: 5.h,),
                      StreamBuilder<String>(
                          stream: updatePackageManager.name$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: nameController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updatePackageManager.inName.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle:  TextStyle(
                                    color: Colors.grey,fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Package Name',
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 5.h,),
                      StreamBuilder<String>(
                          stream: updatePackageManager.quota$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: quotaController,
                              autofocus: false,
                              onChanged: (value){
                                updatePackageManager.inQuota.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle:  TextStyle(
                                    color: Colors.grey,fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Enter Package Quota',
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 10.h,),
                      StreamBuilder<String>(
                          stream: updatePackageManager.price$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: priceController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updatePackageManager.inPrice.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle:  TextStyle(
                                    color: Colors.grey,fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Enter Package Price',
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 10.h,),
                      StreamBuilder<String>(
                          stream: updatePackageManager.duration$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: durationController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updatePackageManager.inDuration.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle:  TextStyle(
                                    color: Colors.grey,fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Enter Package Duration',
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 107.w,
                            height:37.h,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: const Center(child: DashboardTextWidgets(title: 'Cancel',)),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        StreamBuilder<Object>(
                            stream: updatePackageManager.isPackageFormValid$,
                            builder: (context, snapshot) {
                              return InkWell(
                                onTap: () {
                                  Overseer.updatePackageId = widget.id;
                                  if (kDebugMode) {
                                    print("submit${Overseer.updatePackageId}");
                                  }
                                  if (snapshot.hasData == true) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                      barrierDismissible: false,
                                    );
                                    updatePackageManager.isPackageFormSubmit$.listen((event) {})
                                        .onDone(() {
                                      Navigator.of(context).pop();
                                      if (Overseer.statusCode == '200') {
                                        Navigator.pop(context);
                                      }
                                    });
                                  } else {
                                    if (snapshot.error == null) {
                                      Get.snackbar(
                                        "Error",
                                        "Fill the form Properly",
                                        colorText: AppColors.whiteColors,
                                        dismissDirection: DismissDirection.horizontal,
                                        isDismissible: true,
                                        backgroundColor: Colors.orangeAccent,
                                        duration: const Duration(seconds: 3),
                                        icon: const Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                      );
                                    } else {
                                      Get.snackbar(
                                        colorText: Colors.red,
                                        "Error",
                                        "${snapshot.error}",
                                        dismissDirection: DismissDirection.horizontal,
                                        isDismissible: true,
                                        backgroundColor: Colors.orangeAccent,
                                        duration: const Duration(seconds: 3),
                                        icon: const Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  height: 37.h,
                                  width: 107.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Text("Submit",
                                    style: TextStyle(
                                      color: AppColors.grayColors,
                                      fontSize: 18.sp,
                                    ),
                                    ),
                                  ),
                                ),
                              );
                            },),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Text("Edit",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

}
