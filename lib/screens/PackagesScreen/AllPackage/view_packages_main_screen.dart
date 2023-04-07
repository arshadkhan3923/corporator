import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/alert_wialog_widgets_one.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import 'view_package_data_table_screen.dart';
class PackagesMainScreen  extends StatelessWidget {
  const PackagesMainScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Packages',),

        SizedBox(height: 30.h,),
        Container(
          width: 1400,
          decoration: BoxDecoration(
            color: AppColors.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "All Packages",
                    style: TextStyle(
                        color: AppColors.textColors,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500
                    )
                ),
                SizedBox(height: 20.h,),
                const PackageDataTable()

              ],
            ),
          ),
        ),
      ],
    );
  }
}
