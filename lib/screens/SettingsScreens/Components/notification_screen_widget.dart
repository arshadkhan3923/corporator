import 'package:corporator/screens/SettingsScreens/Components/switch_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _switchVal = true;
  bool _switchVal1 = false;
  bool _switchVal2 = false;
  bool _switchVal3 = true;
  bool _switchVal4 = true;
  bool _switchVal5 = false;
  bool _switchVal6 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770.h,
      width: 1158.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColors,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
      ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 0.w, right: 0.w,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Divider(height: 1.h, color: AppColors.grayColors,),
              Padding(
                padding: EdgeInsets.only(
                    left: 30.w, right: 30.w, top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifications Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: AppColors.textColors
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    const DashboardTextWidgets(
                        title: 'We may Still send you some of the important Notifications'),
                    SizedBox(height: 40.h,),
                    Divider(height: 1.h, color: AppColors.grayColors,),
                    SizedBox(height: 25.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email Notifications ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: AppColors.textColors
                              ),
                            ),
                            SizedBox(height: 8.h,),
                            const DashboardTextWidgets(
                                title: 'These are the notifications that can be\nsend you at your email.'),
                          ],
                        ),
                        SizedBox(width: 260.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [

                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal = value);
                                  },
                                  value1: _switchVal,
                                  title: 'Advertise',
                                ),


                              ],
                            ),
                            Row(
                              children: [

                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal1 = value);
                                  },
                                  value1: _switchVal1,
                                  title: 'Promotions',
                                ),


                              ],
                            ),
                            Row(
                              children: [

                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal2 = value);
                                  },
                                  value1: _switchVal2,
                                  title: 'Comments',
                                ),


                              ],
                            ),
                            Row(
                              children: [

                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal3 = value);
                                  },
                                  value1: _switchVal3,
                                  title: 'Reminders',
                                ),


                              ],
                            ),

                            SizedBox(height: 25.h,),
                          ],
                        )
                      ],
                    ),
                    Divider(height: 1.h, color: AppColors.grayColors,),
                    SizedBox(height: 25.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Push Notifications ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: AppColors.textColors
                              ),
                            ),
                            SizedBox(height: 8.h,),
                            const DashboardTextWidgets(
                                title: 'These are the notifications that can be\nsend you at your email.'),
                          ],
                        ),
                        SizedBox(width: 260.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal4 = value);
                                  },
                                  value1: _switchVal4,
                                  title: 'Advertise',
                                ),


                              ],
                            ),
                            Row(
                              children: [
                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal5 = value);
                                  },
                                  value1: _switchVal5,
                                  title: 'Promotions',
                                ),


                              ],
                            ),
                            Row(
                              children: [
                                SwitchButton(
                                  onChange1: (bool value) {
                                    setState(() => _switchVal6 = value);
                                  },
                                  value1: _switchVal6,
                                  title: 'Reminders',
                                ),


                              ],
                            ),
                            SizedBox(height: 25.h,),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 25.h,),
                    Divider(height: 1.h, color: AppColors.grayColors,),
                    SizedBox(height: 40.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.grayColors,
                          ),
                          child: Center(child: Text('Discard')),

                        ),
                        SizedBox(width: 10.w,),
                        Container(
                          height: 40.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.bgColors,
                          ),
                          child: Center(child: Text('save')),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
