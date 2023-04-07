import 'package:corporator/screens/AppThemesScreens/UpdateThemes/update_theme_manager.dart';
import 'package:corporator/screens/AppThemesScreens/UpdateThemes/update_theme_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';

class UpdateThemeScreen extends StatefulWidget {
  String id;
  String? primaryColor;
  String? dGrayColor;
  String? text;
  String? ownerId;
  String? link;
  String? bgColor;
  String? gray;
  String? white;

  UpdateThemeScreen({
    Key? key,
    required this.id,
    this.primaryColor,
    this.dGrayColor,
    this.text,
    this.ownerId,
    this.link,
    this.white,
    this.bgColor,
    this.gray,
  }) : super(key: key);

  @override
  State<UpdateThemeScreen> createState() => _UpdateThemeScreenState();
}
class _UpdateThemeScreenState extends State<UpdateThemeScreen> {
  UpdateThemeService ups = UpdateThemeService();
  final _primaryController = TextEditingController();
  final _bgController = TextEditingController();
  final _titleController = TextEditingController();
  final _dGrayController=TextEditingController();
  final _whiteController=TextEditingController();
  final _grayController=TextEditingController();
  final _linkController=TextEditingController();
  final _owenIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _primaryController.text = widget.primaryColor!;
    _bgController.text = widget.bgColor!;
    _dGrayController.text = widget.dGrayColor!;
    _grayController.text = widget.gray!;
    _titleController.text = widget.text!;
    _whiteController.text = widget.white!;
    _linkController.text = widget.link!;
    _owenIdController.text = widget.ownerId!;
    super.initState();
  }
  @override
  void dispose() {
    _primaryController.dispose();
    _bgController.dispose();
    _titleController.dispose();
    _whiteController.dispose();
    _grayController.dispose();
    _linkController.dispose();
    _owenIdController.dispose();
    _dGrayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UpdateThemeManager updateThemeManager =
    Provider.of(context).fetch(UpdateThemeManager);
    updateThemeManager.inColorPrimary.add(widget.primaryColor!);
    updateThemeManager.inDGray.add(widget.dGrayColor!);
    updateThemeManager.inText.add(widget.text!);
    updateThemeManager.inBgColor.add(widget.bgColor!);
    updateThemeManager.inGray.add(widget.gray!);
    updateThemeManager.inWhite.add(widget.white!);
    updateThemeManager.inLink.add(widget.link!);
    updateThemeManager.inOwner.add(widget.ownerId!);
    return Form(
      key: _formKey,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const DashboardBigTextWidgets(
                  title: 'Edit Theme',
                ),
                content: SizedBox(
                  height: 750.h,
                  width: 300.w,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      StreamBuilder<String>(
                          stream: updateThemeManager.colorPrimary$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _primaryController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inColorPrimary.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Primary Colors',
                              ),
                            );
                          }),
                      ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.dGray$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _dGrayController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inDGray.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'D_Gray Color',
                              ),
                            );
                          }),
                     ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.gray$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _grayController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inGray.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Gray Color',
                              ),
                            );
                          }),
                      ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.white$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _whiteController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inWhite.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'White Color',
                              ),
                            );
                          }),
                      ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.bgColors$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _bgController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inBgColor.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Secondary Color',
                              ),
                            );
                          }),
                     ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.text$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _titleController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inText.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Enter Text',
                              ),
                            );
                          }),
                     ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.link$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _linkController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inLink.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Enter Link',
                              ),
                            );
                          }),
                      ///
                      StreamBuilder<String>(
                          stream: updateThemeManager.ownerId$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _owenIdController,
                              autofocus: false,
                              onChanged: (value) {
                                updateThemeManager.inOwner.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: AppColors.whiteColors,
                                filled: true,
                                labelText: 'Enter Owner Id',
                              ),
                            );
                          }),
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
                            height: 37.h,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: const Center(
                                child: DashboardTextWidgets(
                              title: 'Cancel',
                             ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        StreamBuilder<Object>(
                            stream: updateThemeManager.isUpdateThemeFormValid$,
                            builder: (context, snapshot) {
                              return InkWell(
                                onTap: () {
                                  Overseer.updatePackageId = widget.id;
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
                                    updateThemeManager.isUpdateThemeFormSubmit$
                                        .listen((event) {})
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
                                        dismissDirection:
                                            DismissDirection.horizontal,
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
                                        dismissDirection:
                                        DismissDirection.horizontal,
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
                                    child: Text("Add",
                                      style: TextStyle(
                                        color: AppColors.grayColors,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          "Edit",
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