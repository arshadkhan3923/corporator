import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
class ChartTextWidget extends StatelessWidget {
  final String title;
  const ChartTextWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: TextStyle(
          color: AppColors.bgColors,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
