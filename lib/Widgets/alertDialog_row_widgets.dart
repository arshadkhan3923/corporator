import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class AlertDialogOneWidget extends StatelessWidget {
  final String title;

  const AlertDialogOneWidget({Key? key, required this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
            style: TextStyle(
                color: AppColors.textColors,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
class AlertDialogTwoWidget extends StatelessWidget {
  final String title;

  const AlertDialogTwoWidget({Key? key, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
            style: TextStyle(
                color: AppColors.grayColors,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            ),
          ),

        ],
      ),
    );
  }
}
