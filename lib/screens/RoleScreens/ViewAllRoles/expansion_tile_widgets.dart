import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class DrawerListExpansionTile extends StatelessWidget {
  final String title;
  final String text;
  final String text1;
  final String image;
  final VoidCallback voidCallback1;
  final VoidCallback voidCallback2;

  const DrawerListExpansionTile({Key? key,
    required this.text,
    required this.title,
    required this.text1,
    required this.image,
    required this.voidCallback1,
    required this.voidCallback2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
        title:  Row(
          children: [
            Image.asset(
              image,
              color: AppColors.grayColors,
            ),
            SizedBox(width: 15.w,),
            Text(title,style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
            ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.025),
        children: <Widget>[
          ListTile(
            onTap: voidCallback1,
            title: Text(text,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.grayColors,
      ),
    ),
          ),
          ListTile(
            onTap:voidCallback2,
            title: Text(text1,
    style: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColors,
    ),
            ),
          ),
        ]
    );
  }
}
