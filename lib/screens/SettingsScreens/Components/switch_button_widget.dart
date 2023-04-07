import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class SwitchButton extends StatelessWidget {
   Function(bool) onChange1;
   final String title;
   final bool value1;



   SwitchButton({Key? key,required this.onChange1,required this.value1, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Switch(
          activeColor: AppColors.bgColors,
          focusColor: AppColors.grayColors,
          inactiveTrackColor: AppColors.adminBgColors,
          onChanged: onChange1,
          value: value1,
        ),
        Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.textColors
          ),
        ),
      ],
    );
  }
}
