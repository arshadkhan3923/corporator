import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


class Button extends StatelessWidget {
  Button({super.key,required this.onTap, required this.title, required this.bg});
  String title;
  Color bg;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        height: 60.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
            color: AppColors.whiteColors,
          ),
        )),
      ),
    );
  }
}
