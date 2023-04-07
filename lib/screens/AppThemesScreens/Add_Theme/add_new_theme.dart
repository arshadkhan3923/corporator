import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../AppLayers/Streaming/Provider.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../Widgets/Button.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import 'add_new_theme_manager.dart';

class AddThemeDataScreen extends StatefulWidget {
   AddThemeDataScreen({Key? key,}) : super(key: key);
  @override
  State<AddThemeDataScreen> createState() => _AddThemeDataScreenState();
}
class _AddThemeDataScreenState extends State<AddThemeDataScreen> {
  File _file = File("zzzz");
  Uint8List webImage = Uint8List(10);
  Future<PermissionStatus> requestPermissions() async {
    await Permission.photos.request();
    return Permission.photos.status;
    }

  final _formKey=GlobalKey<FormState>();
  final _bgController=TextEditingController();
  final _titleController=TextEditingController();
  final _dGrayController=TextEditingController();
  final _whiteController=TextEditingController();
  final _grayController=TextEditingController();
  final _linkController=TextEditingController();
  final _primaryController=TextEditingController();
  final _owenIdController=TextEditingController();


  uploadImage() async {
    var permissionStatus = requestPermissions();

    // MOBILE
    if (!kIsWeb && await permissionStatus.isGranted) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);

        setState(() {
          _file = selected;
        });
      } else {
        print("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("a");
          webImage = f;
        });
      } else {
        print("No file selected");
      }
    } else {
      print("Permission not granted");
    }
    }


  @override
  Widget build(BuildContext context) {
    AddNewThemeManager appNewThemeManager = Provider.of(context).fetch(AddNewThemeManager);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(title: 'App Themes',),
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
                          "Add New Themes",
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
                  Text("BG Color",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: appNewThemeManager.bgColor$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _bgController,
                        autofocus: false,
                        onChanged: (value) {
                          appNewThemeManager.inBgColor.add(value);
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
                          labelText: 'Bg Color',
                          fillColor: AppColors.whiteColors,
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      );
                    }
                  ),
                  ///
                  Text("Text",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: appNewThemeManager.text$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _titleController,
                        autofocus: false,
                        onChanged: (value) {
                          appNewThemeManager.inText.add(value);
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
                          labelText: 'Text',
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
                  Text("White",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: appNewThemeManager.white$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _whiteController,
                          autofocus: false,
                          onChanged: (value) {
                            appNewThemeManager.inWhite.add(value);
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
                            labelText: 'White',
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
                  Text("D_Gray",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: appNewThemeManager.dGray$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _dGrayController,
                          autofocus: false,
                          onChanged: (value) {
                            appNewThemeManager.inDGray.add(value);
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
                            labelText: 'D_Gray',
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
                  Text("Grey",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: appNewThemeManager.gray$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _grayController,
                          autofocus: false,
                          onChanged: (value) {
                            appNewThemeManager.inGray.add(value);
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
                            labelText: 'Grey',
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
                  Text("Link",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: appNewThemeManager.link$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _linkController,
                        autofocus: false,
                        onChanged: (value) {
                          appNewThemeManager.inLink.add(value);
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
                          labelText: 'Link',
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
                  Text("Primary Color",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: appNewThemeManager.primaryColor$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _primaryController,
                          autofocus: false,
                          onChanged: (value) {
                            appNewThemeManager.inPrimaryColor.add(value);
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
                            labelText: 'Primary Color Name',
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
                      stream: appNewThemeManager.ownerId$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _owenIdController,
                          autofocus: false,
                          onChanged: (value) {
                            appNewThemeManager.inOwnerId.add(value);
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
                            labelText: 'Owner Id',
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
                  Text("Image",
                    style: TextStyle(color: AppColors.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          uploadImage();
                        },
                        child: Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child:(_file.path == "zz")
                              ? Image.asset("appNewThemeManager.themeImage.toString()")
                              : (kIsWeb)
                              ? Image.memory(webImage)
                              : Image.file(_file),

                        ),
                      ),
                      StreamBuilder<Object>(
                          stream: appNewThemeManager.isFormAddNewThemeValid$,
                          builder: (context, snapshot) {
                            return Button(title: 'Add New Theme',
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
                                  appNewThemeManager.isFormAddNewThemeSubmit$.listen((event) {})
                                      .onDone(() {
                                    Navigator.of(context).pop();
                                    if(Overseer.statusCode == '200'){
                                      Get.snackbar(
                                        "Congratulation",
                                        colorText: AppColors.whiteColors,
                                        backgroundColor: AppColors.secondaryColor,
                                        "Theme added successfully!",
                                        icon: const Icon(Icons.error_outline, color: Colors.white),
                                        snackPosition: SnackPosition.TOP,
                                      );
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
