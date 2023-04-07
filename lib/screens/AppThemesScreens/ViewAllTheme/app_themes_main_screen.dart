import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles//dashboard_big_text_widgets.dart';
import 'app_theme_data_table_screen.dart';

class AppThemesMainScreen extends StatelessWidget {
  const AppThemesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "View All Themes",
                          style: TextStyle(
                              color: AppColors.textColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  const AppThemeDataTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

