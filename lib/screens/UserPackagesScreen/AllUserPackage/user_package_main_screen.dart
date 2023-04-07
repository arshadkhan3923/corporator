import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import 'user_package_data_table_screen.dart';
import 'user_package_chart.dart';
import 'chart_text_widget.dart';
import 'second_chart_widget.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import 'uaer_package_container_widget.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';

class UserPackageMainScreen extends StatelessWidget {
  const UserPackageMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(
            title: 'User Package',
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              const UserPackageContainerWidget(
                title: 'Total User',
                text: '430K',
                color: AppColors.bgColors,
                color1: AppColors.whiteColors,
                color2: AppColors.whiteColors,
              ),
              SizedBox(
                width: 30.w,
              ),
              const UserPackageContainerWidget(
                title: 'Basic Package Users',
                text: '200K',
                color: AppColors.whiteColors,
                color1: AppColors.bgColors,
                color2: AppColors.bgColors,
              ),
              SizedBox(
                width: 30.w,
              ),
              const UserPackageContainerWidget(
                title: 'Standard Package Users',
                text: '150K',
                color: AppColors.whiteColors,
                color1: AppColors.bgColors,
                color2: AppColors.bgColors,
              ),
              SizedBox(
                width: 30.w,
              ),
              const UserPackageContainerWidget(
                title: 'Premium Package Users',
                text: '80K',
                color: AppColors.whiteColors,
                color1: AppColors.bgColors,
                color2: AppColors.bgColors,
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Container(
                height: 320.h,
                width: 564.w,
                padding: EdgeInsets.only(right: 20.w,top: 15.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20.w,),
                        Text(
                          'Packages Sales',
                          style: TextStyle(
                              color: AppColors.bgColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Container(
                          height: 30.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.grayColors,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Text(
                                  'Last 20 days',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Expanded(
                      child: BarChartUsers(),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 30.h,
              ),
              Container(
                width: 564.w,
                height: 320.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColors,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Revenue',
                            style: TextStyle(
                                color: AppColors.bgColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '\$124,5970',
                            style: TextStyle(
                                color: AppColors.bgColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              const ChartTextWidget(
                                title: 'M8',
                              ),
                              SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M17',
                              ),
                              SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M6',
                              ),
                              SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M5',
                              ),
                              SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M4',
                              ),
                              SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M3',
                              ),
                              SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M2',
                              ),
                               SizedBox(
                                height: 9.w,
                              ),
                              const ChartTextWidget(
                                title: 'M1',
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          const SecondChartWidgets(),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 35.w,
                          ),
                          const ChartTextWidget(
                            title: 'Jan',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Feb',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Mar',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Apr',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'May',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Jun',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'July',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Aug',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Sep',
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const ChartTextWidget(
                            title: 'Oct',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Users",
                          style: TextStyle(
                              color: AppColors.textColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500)),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.bgColors,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.2,
                            vertical: defaultPadding /
                                (Responsive.isMobile(context) ? 2 : 1),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("View All"),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ShowEntryAndSearch(number: "",),
                  SizedBox(height: 20.h),
                  const UserPackageDataTable()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
