import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import 'user_data_table_screen.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Users',),
     SizedBox(height: 30.h,),
        Container(
          height: 822.h,
            width: 1158.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "All Users",
                        style: TextStyle(
                            color: AppColors.textColors,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    SizedBox(height: 20.h),
                     UserDataTable(),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
