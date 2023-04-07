import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/Button.dart';
import '../../../utils/app_colors.dart';
import '../login/login_screen.dart';
import 'change_password_manager.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}


bool _passwordVisible=true;
class _ChangePasswordState extends State<ChangePassword> {
  final _formKey=GlobalKey<FormState>();
  final changePasswordController=TextEditingController();



  @override
  void dispose() {
changePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResetPasswordManager resetPasswordManager = Provider.of(context).fetch(ResetPasswordManager);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Change Your Password?",
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
                    stream: resetPasswordManager.password$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: changePasswordController,
                        autofocus: false,
                        obscureText: _passwordVisible,
                        onChanged: (value){
                          resetPasswordManager.inPassword.add(value);
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
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                              color:Colors.black,
                            ),
                            onPressed: () {
                              // Update the state i.e. google the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          labelText: 'Change Your Password',
                        ),
                      );
                    }
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              StreamBuilder<Object>(
                  stream: resetPasswordManager.isResetPasswordValid$,
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
                          resetPasswordManager.isResetPasswordSubmit$.listen((event) {})
                              .onDone(() {
                            Navigator.of(context).pop();
                            if(Overseer.statusCode == '200'){
                              Get.offAll( LoginScreen());
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
                              duration: const Duration(seconds: 3),
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
