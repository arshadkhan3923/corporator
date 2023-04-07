import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/alertDialog_row_widgets.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_big_text_widgets.dart';
import '../Model/download_data_table_model.dart';

class DownloadDataTable extends StatelessWidget {
  const DownloadDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      Text("Upload Date",
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
                downloadUsers.length,
                (index) => downloadUserDataRow(downloadUsers[index], context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

DataRow downloadUserDataRow(DownloadActivityModel userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.asset(userInfo.image!),
            SizedBox(width: 15.w,),
            Text(userInfo.name!,
              style: TextStyle(
                color: AppColors.textColors,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]
        ),
      ),
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
        Text(userInfo.size!,
          style: TextStyle(
            color: AppColors.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.uploadData!,
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
