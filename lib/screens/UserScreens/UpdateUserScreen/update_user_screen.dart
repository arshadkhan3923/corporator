import 'package:corporator/screens/UserScreens/UpdateUserScreen/update_user_services.dart';
import 'package:corporator/screens/UserScreens/UpdateUserScreen/userUpdate_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';

class UpdateUserScreen extends StatefulWidget {
  int id;
  String? name;
  String? email;
  String? password;
  String? role;
   UpdateUserScreen({Key? key,
     required this.id,
     this.name,
     this.email,
     this.password,
     this.role
   }) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userRoleController = TextEditingController();
  UpdateUserService ups=UpdateUserService();

  @override
  void initState() {
    emailController.text= widget.name!;
    userNameController.text= widget.email!;
    userPasswordController.text= widget.password!;
    userRoleController.text= widget.role!;
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    userPasswordController.dispose();
    userRoleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    UpdateUserManager updateUserManager = Provider.of(context).fetch(UpdateUserManager);
    updateUserManager.inName.add(widget.name!);
    updateUserManager.inEmail.add(widget.email!);
    updateUserManager.inPassword.add(widget.password!);
    updateUserManager.inRole.add(widget.role!);
    return Form(
      key: _formKey,
      child: InkWell(
        onTap: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                backgroundColor: Colors.white,
                title: const DashboardBigTextWidgets(title:'Edit User',),
                content: SizedBox(
                  height: 420.h,
                  width: 300.w,
                  child: Column(
                    children:   [
                      SizedBox(height: 10.h,),
                      StreamBuilder<String>(
                          stream: updateUserManager.name$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: userNameController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updateUserManager.inName.add(value);
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
                                labelText: 'User Name',
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 10.h,),
                      StreamBuilder<String>(
                          stream: updateUserManager.email$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: emailController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updateUserManager.inEmail.add(value);
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
                                labelText: 'Enter User Email ',
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 10.h,),
                      StreamBuilder<String>(
                          stream: updateUserManager.password$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: userPasswordController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updateUserManager.inPassword.add(value);
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
                                labelText: 'Enter User Password',
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 10.h,),
                      StreamBuilder<String>(
                          stream: updateUserManager.role$,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: userRoleController,
                              autofocus: false,
                              // obscureText: _passwordVisible,
                              onChanged: (value){
                                updateUserManager.inRole.add(value);
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
                                labelText: 'Enter User Role',
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
                            stream: updateUserManager.isUserFormValid$,
                            builder: (context, snapshot) {
                              return InkWell(
                                onTap: () {
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
                                    updateUserManager.isUserFormSubmit$.listen((event) {})
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
                            }),
                        // InkWell(
                        //   child: Container(
                        //       height: 37.h,
                        //       width: 107.w,
                        //       decoration: BoxDecoration(
                        //         color: AppColors.bgColor,
                        //         borderRadius: BorderRadius.circular(15.r),
                        //       ),
                        //       child: const Center(
                        //         child: DashboardTextWidgets(title: 'Submit',),
                        //       )
                        //   ),
                        //   onTap: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       setState((){
                        //         apiCall=true;
                        //         if(apiCall==true){
                        //           indicator(context);
                        //         }
                        //       });
                        //       _callWeatherApi();
                        //     }
                        //   },
                        // ),
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

  // bool apiCall = false;
  // Future<void> _callWeatherApi() async {
  //   var api =  await ups.UpdateUser(
  //       userNameController.text ,
  //       emailController.text,
  //       userPasswordController.text,
  //       userRoleController.text,
  //       widget.id);
  //   print("========***********====${api}");
  //   if(api==true) {
  //     apiCall= false;
  //     setState(() {});
  //    Navigator.pop(context);
  //   } else {
  //     apiCall=false;
  //     setState(() {});
  //   }
  // }
  //
  // Future<void> indicator(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return  const Center(
  //         child: CircularProgressIndicator()
  //       );
  //     },
  //   );
  // }
}
