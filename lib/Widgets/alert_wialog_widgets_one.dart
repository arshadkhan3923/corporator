import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../screens/RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';

class AlertDialogWidgetsOne extends StatelessWidget {
  final String title0;
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const AlertDialogWidgetsOne({Key? key,
    required this.title0,
    required this.title,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: DashboardBigTextWidgets(title:title0,),
      content: Container(
        height: 150.h,
        width: 200.w,
        child: Column(
          children:   [
             TextField(
              style:const TextStyle(
                  color: Colors.black
              ),
              decoration: InputDecoration(
                  hintText: title,
                  hintStyle:const TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            Row(
              children:  [
                Expanded(child:
                TextField(
                  style: const TextStyle(
                  color: Colors.black
                ),
                  decoration: InputDecoration(
                      hintText: text1,
                      hintStyle: const TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
                ),
                Expanded(child:
                TextField(
                  style: const TextStyle(
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                      hintText: text2,
                      hintStyle:const TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
                ),
              ],
            ),

          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 107.w,
                  height:37.h,

                  decoration: BoxDecoration(
                    color: const Color(0xff6B7181),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child:  Center(child: DashboardTextWidgets(title: text3,)),
                ),
              ),

              SizedBox(width: 20.w),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 107.w,
                  height:37.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1D41),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child:  Center(child: DashboardTextWidgets(title: text4,)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
