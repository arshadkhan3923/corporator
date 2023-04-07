import 'package:corporator/screens/Auth/VerifyForgetPassword/verify_password_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/Button.dart';
import '../../../utils/app_colors.dart';
import '../ChangePassword/change_password_screen.dart';

class VerifyForgetPassword extends StatefulWidget {
  String? email;
   VerifyForgetPassword({Key? key,this.email}) : super(key: key);

  @override
  State<VerifyForgetPassword> createState() => _VerifyForgetPasswordState();
}
class _VerifyForgetPasswordState extends State<VerifyForgetPassword> {
  final emailController=TextEditingController();
  final codeController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  void initState() {
   emailController.text= widget.email!;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    VerifyForgetPasswordManager verifyForgetPasswordManager = Provider.of(context).fetch(VerifyForgetPasswordManager);
    verifyForgetPasswordManager.inEmail.add(widget.email!);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Check Your Email OTP?",
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
                    stream: verifyForgetPasswordManager.email$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        readOnly: true,
                        controller: emailController,
                        autofocus: false,
                        // obscureText: _passwordVisible,
                        onChanged: (value){
                          verifyForgetPasswordManager.inEmail.add(value);
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
                               Icons.email_outlined,
                              size: 20.sp,
                              color:AppColors.bgColor,
                            ),
                            onPressed: () {
                              // Update the state i.e. google the state of passwordVisible variable
                            },
                          ),
                          labelText: 'enter email',
                        ),
                      );
                    }
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              Center(
                child: SizedBox(
                  width: 350.w,
                  child: StreamBuilder<String>(
                    stream: verifyForgetPasswordManager.code$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: codeController,
                        autofocus: false,
                        onChanged: (value){
                          verifyForgetPasswordManager.inCode.add(value);
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
                          labelText: 'enter your otp',
                        ),
                      );
                    }
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              StreamBuilder<Object>(
                  stream: verifyForgetPasswordManager.isVerifyForgetPasswordValid$,
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
                          verifyForgetPasswordManager.isVerifyForgetPasswordSubmit$.listen((event) {})
                              .onDone(() {
                            Navigator.of(context).pop();
                            if(Overseer.statusCode == '200'){
                              Get.to(const ChangePassword());
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