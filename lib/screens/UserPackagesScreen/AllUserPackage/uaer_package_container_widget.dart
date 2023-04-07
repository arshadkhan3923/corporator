import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
class UserPackageContainerWidget extends StatelessWidget {
  final String title;
  final String text;
  final Color color;
  final Color color1;
  final Color color2;
  const UserPackageContainerWidget({Key? key,
    required this.title,
    required this.text,
    required this.color,
    required this.color1,
    required this.color2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100.h,
      width: 267.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 26.w,top: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: TextStyle(
                color: color1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h,),
            Text(text,
              style: TextStyle(
                color: color2,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
