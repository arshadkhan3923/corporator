import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DashboardTextWidgets extends StatelessWidget {
  final String title;
  const DashboardTextWidgets({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Text(title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.grayColors,
      ),
    );
  }
}
