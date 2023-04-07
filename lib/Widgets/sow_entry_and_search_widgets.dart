import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../responsive.dart';
import '../screens/RoleScreens/ViewAllRoles/header.dart';
import '../utils/app_colors.dart';

class ShowEntryAndSearch extends StatelessWidget {
  String? number;
  ShowEntryAndSearch({Key? key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text('Show',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textColors,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          height: 35.h,
          width: 25.w,
          decoration: BoxDecoration(
            color: AppColors.adminBgColors,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(child: Text(number!,style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.bgColors
          ),)),
        ),
        SizedBox(width: 10.w),
        Text('Entries',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textColors,
          ),
        ),
        Spacer(),
        // SizedBox(width: Get.width*.48),
        if(!Responsive.isMobile(context))
          SizedBox(
              height: Get.height*.050,
              width: 200.w,
              child: const SearchField()
          ),
      ],
    );
  }
}
