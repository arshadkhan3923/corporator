import 'package:corporator/screens/SettingsScreens/Components/security_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';
import '../../RoleScreens/ViewAllRoles/header.dart';
import 'account_screen_widget.dart';
import 'my_profile_screen_widget.dart';
import 'notification_screen_widget.dart';

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({Key? key}) : super(key: key);

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}
class _SettingsMainScreenState extends State<SettingsMainScreen> {
  int _isListVisible = 1;
  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(title: 'Settings',),
          SizedBox(height: 30.h,),
          Container(
            height: 50.h,
            width: 1158.w,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(10.r),
             topRight: Radius.circular(10.r),
           ),
             color: AppColors.whiteColors,
         ),
            child:  Row(
              children: [

                InkWell(
                  onTap: (){
                    setState(() {
                      _isListVisible = 1;
                    });

                  },
                  child: Container(
                    width: 120,
                    height: 50.h,
                    color: _isListVisible==1? AppColors.bgColors:AppColors.whiteColors,
                    child: const Center(
                        child: DashboardTextWidgets(title: 'My Profile',)
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      _isListVisible = 2;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 50.h,
                    color: _isListVisible==2? AppColors.bgColors:AppColors.whiteColors,
                    child: const Center(
                        child: DashboardTextWidgets(title: 'Account',)
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      _isListVisible = 3;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 50.h,
                      color: _isListVisible==3? AppColors.bgColors:AppColors.whiteColors,
                    child: const Center(
                        child: DashboardTextWidgets(
                          title: 'Notification',)
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      _isListVisible = 4;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 50.h,
                    color: _isListVisible==4? AppColors.bgColors:AppColors.whiteColors,
                    child: const Center(
                        child: DashboardTextWidgets(title: 'Security',)
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                    padding: EdgeInsets.only(left: 20.w,
                        right: 40.w,
                        top: 5.h,
                        bottom: 5.h),
                    child: SizedBox(
                        height: Get.height * .060,
                        width: Get.width * .1,
                        child: const SearchField()
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
           _isListVisible==1?const MyProfileScreen():
           _isListVisible==2?const AccountScreen():
           _isListVisible==3?const NotificationScreen():
           _isListVisible==4?const SecurityScreen():Container(),
        ],
      );
  }
}