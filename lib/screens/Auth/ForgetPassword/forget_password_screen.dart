import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/Button.dart';
import '../../../utils/app_colors.dart';
import '../VerifyForgetPassword/verify_forget_password.dart';
import 'forget_password_manager.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey=GlobalKey<FormState>();
  final forgetPasswordController=TextEditingController();
  @override
  void dispose(){
    forgetPasswordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ForgetPasswordManager forgetPasswordManager = Provider.of(context).fetch(ForgetPasswordManager);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Enter Your Email?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                ),
              ),
           SizedBox(height: 40.h,),
          Center(
            child: SizedBox(
            width: 350.w,
              child: StreamBuilder<String>(
                stream: forgetPasswordManager.email$,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: forgetPasswordController,
                    onChanged: (value){
                      forgetPasswordManager.inEmail.add(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Colors.black,width: 1.w),
                      ),
                      errorStyle:
                      TextStyle(color: Colors.grey,
                        fontSize: 18.sp,
                      ),

                      labelStyle:  TextStyle(
                          color: Colors.grey,fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      fillColor: AppColors.whiteColors,
                      filled: true,
                      errorText: snapshot.error == null
                          ? ""
                          : snapshot.error.toString(),
                      labelText: 'enter email',
                    ),
                  );
                }
              ),
            ),
          ),
              SizedBox(height: 30.h,),
              StreamBuilder<Object>(
                  stream: forgetPasswordManager.isForgetPasswordValid$,
                  builder: (context, snapshot) {
                    return Button(title: 'Next',
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
                          forgetPasswordManager.isForgetPasswordSubmit$.listen((event) {})
                              .onDone(() {
                            Navigator.of(context).pop();
                            if(Overseer.statusCode == '200'){
                              Get.to( VerifyForgetPassword(email:forgetPasswordController.text.toString()));
                            }
                          });
                        }else{
                          if(snapshot.error == null){
                            Get.snackbar(
                              "Error",
                              "Fill the form Properly",
                              colorText: AppColors.whiteColors,
                              dismissDirection:
                              DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor:Colors.orangeAccent,
                              duration: Duration(seconds: 3),
                              icon: const Icon(Icons.error_outline,
                                color: Colors.red,
                              ),
                            );
                          }else{
                            Get.snackbar(
                              colorText: AppColors.whiteColors,
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
        ),
      ),
    );
  }
}
