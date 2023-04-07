import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/alert_wialog_widgets_one.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import 'memory_quota_data_table_screen.dart';

class MemoryQuotaMainScreen extends StatelessWidget {
  const MemoryQuotaMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Memory Quota ',),

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
                        "All Memory Quota ",
                        style: TextStyle(
                            color: AppColors.textColors,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    ElevatedButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.bgColors,
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.2,
                          vertical:
                          defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialogWidgetsOne(
                              title0: 'Add Memory Quota',
                              title: 'Memory Name',
                              text1: 'Limit',
                              text2: 'Price',
                              text3: 'Cancel',
                              text4: 'Add',
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.add,size: 16.sp,),
                      label: Text("Add New",style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.whiteColors,
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                ShowEntryAndSearch(number: "",),
                SizedBox(height: 20.h),
                MemoryQuotaDataTable(),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
