import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../../responsive.dart';
import '../../../Widgets/alertDialog_row_widgets.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../../RoleScreens/ViewAllRoles/header.dart';
import 'upload_user_model.dart';


class UploadDataTable extends StatelessWidget {
  const UploadDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColors,
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Uploads",
                  style: TextStyle(
                      color: AppColors.textColors,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500
                  )
              ),
              if(!Responsive.isMobile(context))
                SizedBox(
                    height: Get.height*.040,
                    width: Get.width*.2,
                    child: const SearchField()
                ),
            ],
          ),
          SizedBox(height: 10.h,),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: MediaQuery.of(context).size.width*.1,
                columns:  [
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Name",
                        style: TextStyle(
                          color: AppColors.grayColors,
                          fontSize: 22.sp
                        ),
                        ),
                        Icon(Icons.arrow_drop_down,size: 22.sp, color: AppColors.grayColors,),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Type",
                          style: TextStyle(
                              color: AppColors.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down,size: 22.sp,color: AppColors.grayColors,),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Size",
                          style: TextStyle(
                              color: AppColors.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down,size: 22.sp,color: AppColors.grayColors,),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Upload Data",
                          style: TextStyle(
                              color: AppColors.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down,size: 22.sp,color: AppColors.grayColors,),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Text("Action",
                      style: TextStyle(
                        color: AppColors.grayColors,
                        fontSize: 22.sp
                    ),
                    ),
                  ),
                ],
                rows: List.generate(
                  uploadUsers.length,
                  (index) => uploadUserDataRow(uploadUsers[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow uploadUserDataRow(UploadActivityModel userInfo, BuildContext context) {
  return DataRow(
    cells: [

      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                children: [
                  Image.asset(userInfo.image!),
                  SizedBox(width: 8.w,),
                  Text(
                    userInfo.name!,
                    style: TextStyle(
                      color: AppColors.textColors,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      DataCell(
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0.r) ,//
                ),
          ),
          child: Text(userInfo.size!,
            style: TextStyle(
              color: AppColors.textColors,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          )),
      ),
      DataCell(
          Text(userInfo.uploadData!,
        style: TextStyle(
          color: AppColors.textColors,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
      )),
      DataCell(
        Text(userInfo.typename!,
        style: TextStyle(
        color: AppColors.textColors,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      ),
      ),
      DataCell(
        InkWell(
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return  AlertDialog(
                  backgroundColor: Colors.white,

                  content: Container(
                    height: 320.h,
                    width: 550.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Image.asset('assets/images/details_pic.png',height: 290.h,width: 194.w,),
                        SizedBox(width: 20.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:   [
                            SizedBox(height: 31.h,),
                            const DashboardBigTextWidgets(title: 'Detail'),
                            SizedBox(height: 25.h,),
                            const AlertDialogTwoWidget(title: 'Name', ),
                            SizedBox(height: 25.h,),
                            const AlertDialogTwoWidget(title: 'Type', ),
                            SizedBox(height: 25.h,),
                            const AlertDialogTwoWidget(title: 'Uploaded by ',),
                            SizedBox(height: 25.h,),
                            const AlertDialogTwoWidget(title: 'Size',),
                            SizedBox(height: 25.h,),
                            const AlertDialogTwoWidget(title: 'Upload Date',)

                          ],
                        ),
                        SizedBox(width: 150.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:   [
                            SizedBox(height: 90.h,),
                            const AlertDialogOneWidget(title: 'PNG File',),
                            SizedBox(height: 25.h,),
                            const AlertDialogOneWidget(title: 'Norman Imran', ),
                            SizedBox(height: 25.h,),
                            const AlertDialogOneWidget(title: 'Uploaded by ',),
                            SizedBox(height: 25.h,),
                            const AlertDialogOneWidget(title: '170 kb', ),
                            SizedBox(height: 25.h,),
                            const AlertDialogOneWidget(title: '27/07/2022', )

                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: const <Widget>[
                  ],
                );
              },
            );
          },
          child: Text(userInfo.action!,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),

    ],
  );
}
