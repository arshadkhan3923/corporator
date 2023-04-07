import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBigTextWidgets extends StatelessWidget {
  final String title;
  const DashboardBigTextWidgets({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Text(title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
    );
  }
}
