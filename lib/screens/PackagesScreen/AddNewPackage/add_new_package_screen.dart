import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/Button.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import 'add_new_package_manager.dart';

class AddPackageDataScreen extends StatefulWidget {
  const AddPackageDataScreen({Key? key,}) : super(key: key);
  @override
  State<AddPackageDataScreen> createState() => _AddPackageDataScreenState();
}
class _AddPackageDataScreenState extends State<AddPackageDataScreen> {

  final _formKey=GlobalKey<FormState>();
  final _nameController=TextEditingController();
  final _quotaController=TextEditingController();
  final _priceController=TextEditingController();
  final _durationController=TextEditingController();
  final _owenIdController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    AddNewPackageManager addNewPackageManager = Provider.of(context).fetch(AddNewPackageManager);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(title: 'App Package',),
          SizedBox(height: 30.h,),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Add New Package",
                          style: TextStyle(
                              color: AppColors.textColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500
                          )
                      ),

                    ],
                  ),
                  SizedBox(height: 20.h),
                  ///
                  Text("Name",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: addNewPackageManager.name$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _nameController,
                          autofocus: false,
                          onChanged: (value) {
                            addNewPackageManager.inName.add(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(color: Colors.black, width: 1.w),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'name',
                            fillColor: AppColors.whiteColors,
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }
                  ),

                  ///
                  Text("Quota",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: addNewPackageManager.quota$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _quotaController,
                          autofocus: false,
                          onChanged: (value) {
                            addNewPackageManager.inQuota.add(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(color: Colors.black, width: 1.w),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Enter Quota',
                            fillColor: AppColors.whiteColors,
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }
                  ),

                  ///
                  Text("Price",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: addNewPackageManager.price$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _priceController,
                          autofocus: false,
                          onChanged: (value) {
                            addNewPackageManager.inPrice.add(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(color: Colors.black, width: 1.w),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'enter price',
                            fillColor: AppColors.whiteColors,
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }
                  ),

                  ///
                  Text("Duration",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: addNewPackageManager.duration$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _durationController,
                          autofocus: false,
                          onChanged: (value) {
                            addNewPackageManager.inDuration.add(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(color: Colors.black, width: 1.w),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'enter duration',
                            fillColor: AppColors.whiteColors,
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }
                  ),

                  ///
                  Text("Owner Id",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: addNewPackageManager.ownerId$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _owenIdController,
                          autofocus: false,
                          onChanged: (value) {
                            addNewPackageManager.inOwnerId.add(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(color: Colors.black, width: 1.w),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Owner Id ',
                            fillColor: AppColors.whiteColors,
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }
                  ),

                  /// button
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StreamBuilder<Object>(
                          stream: addNewPackageManager.isFormAddNewPackageValid$,
                          builder: (context, snapshot) {
                            return Button(title: 'Add New Package',
                              bg: AppColors.bgColor,
                              onTap:(){
                                if(snapshot.hasData == true){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return  const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    barrierDismissible: false,
                                  );
                                  addNewPackageManager.isFormAddNewPackageSubmit$.listen((event) {})
                                      .onDone(() {
                                    Navigator.of(context).pop();
                                    if(Overseer.statusCode == '200'){
                                    }
                                  });
                                }else{
                                  if(snapshot.error == null){
                                    Get.snackbar(
                                      "Error",
                                      "Fill the form Properly",
                                      dismissDirection:
                                      DismissDirection.horizontal,
                                      isDismissible: true,
                                      backgroundColor:Colors.orangeAccent,
                                      duration: const Duration(seconds: 3),
                                      icon: const Icon(Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    );
                                  }else{
                                    Get.snackbar(
                                      "Error",
                                      "${snapshot.error}",
                                      dismissDirection:
                                      DismissDirection.horizontal,
                                      isDismissible: true,
                                      backgroundColor:Colors.orangeAccent,
                                      duration: const Duration(seconds: 3),
                                      icon: const Icon(Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
