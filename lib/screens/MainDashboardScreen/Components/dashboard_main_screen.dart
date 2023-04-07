import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';
import '../../UserPackagesScreen/AllUserPackage/chart_text_widget.dart';
import '../../UserPackagesScreen/AllUserPackage/second_chart_widget.dart';
import '../../UserPackagesScreen/AllUserPackage/uaer_package_container_widget.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import 'dashboard_data_table_one.dart';
import 'dashboard_data_table_two.dart';

class DashboardMainScreen extends StatelessWidget{
  const DashboardMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Dashboard',),
        SizedBox(height: 30.h,),
        Row(
          children:[
             const UserPackageContainerWidget(
              title: 'Total User',
              text: '430K',
              color: AppColors.bgColors,
              color1: AppColors.whiteColors,
              color2: AppColors.whiteColors,
            ),
            SizedBox(width: 30.w,),
             Container(
              height: 100.h,
              width: 267.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColors,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 26.w,top: 18.h,right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Revenue',
                          style: TextStyle(
                            color: AppColors.bgColors,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('Last 30 days',
                          style: TextStyle(
                            color: AppColors.bgColors,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text('\$1.5M',
                      style: TextStyle(
                        color: AppColors.bgColors,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 30.w,),
            const UserPackageContainerWidget(
              title: 'Downloads Activity',
              text: '150K',
              color: AppColors.whiteColors,
              color1: AppColors.bgColors,
              color2: AppColors.bgColors,
            ),
            SizedBox(width: 30.w,),
            const UserPackageContainerWidget(
              title: 'Upload Activity ',
              text: '80K',
              color: AppColors.whiteColors,
              color1: AppColors.bgColors,
              color2: AppColors.bgColors,
            ),
          ],
        ),
        SizedBox(height: 30.h,),
        SizedBox(
          height: 326.h,
          child: Row(
            children: [
              Container(
                width: 564.w,
                height: 325.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColors,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DashboardBigTextWidgets(title: 'Roles'),
                            InkWell(
                                onTap: (){},
                                child: const DashboardTextWidgets(title: 'View All'))
                          ],
                        ),
                      ),
                      DashboardRolesDataTable(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 33.w,),
              Container(
                width: 564.w,
                height: 325.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColors,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 25.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Revenue',
                              style: TextStyle(
                                  color: AppColors.bgColors,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text('\$124,5970',
                              style: TextStyle(
                                  color: AppColors.bgColors,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Column(
                              children: [
                                const ChartTextWidget(title: 'M8',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M17',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M6',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M5',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M4',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M3',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M2',),
                                SizedBox(height: 9.w,),
                                const ChartTextWidget(title: 'M1',),
                              ],
                            ),
                            SizedBox(width: 15.w,),
                            const SecondChartWidgets(),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            SizedBox(width: 35.w,),
                            const ChartTextWidget(title: 'Jan',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Feb',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Mar',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Apr',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'May',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Jun',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'July',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Aug',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Sep',),
                            SizedBox(width: 25.w,),
                            const ChartTextWidget(title: 'Oct',),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h,),
        SizedBox(
          height: 326.h,
          child: Row(
            children: [
              Container(
                width: 564.w,
                height: 325.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColors,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DashboardBigTextWidgets(title: 'Users'),
                            InkWell(
                                onTap: (){},
                                child: const DashboardTextWidgets(title: 'View All'))
                          ],
                        ),
                      ),
                      DashboardUserDataTable(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 33.w,),
              Container(
                width: 564.w,
                height: 325.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColors,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DashboardBigTextWidgets(title: 'Vendors'),
                            InkWell(
                                onTap: (){},
                                child: const DashboardTextWidgets(title: 'View All'))
                          ],
                        ),
                      ),
                      DashboardRolesDataTable(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
