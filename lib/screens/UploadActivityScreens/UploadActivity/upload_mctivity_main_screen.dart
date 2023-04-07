import 'package:corporator/screens/UploadActivityScreens/UploadActivity/upload_Activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';

class UploadActivityMainScreen  extends StatelessWidget {
  const UploadActivityMainScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Upload Activity',),

        SizedBox(height: 30.h,),
        const UploadDataTable(),

      ],
    );
  }
}

