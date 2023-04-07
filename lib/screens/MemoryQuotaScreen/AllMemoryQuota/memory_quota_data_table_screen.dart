import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../Widgets/alert_wialog_widgets_one.dart';
import '../../../utils/app_colors.dart';
import 'memory_quota_data_table_model.dart';

class MemoryQuotaDataTable extends StatelessWidget {
  const MemoryQuotaDataTable({
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
                        SizedBox(width: 15.w,),
                        Text("ID",
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
                        Text("Max Space",
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
                        Text("User Id",
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
                        Text("Package Id",
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
                  memoryQuotaModel.length,
                      (index) => memoryQuotaUserDataRow(memoryQuotaModel[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow memoryQuotaUserDataRow(MemoryQuotaDataTableModel userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(userInfo.id!,
            style: TextStyle(
              color: AppColors.textColors,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      DataCell(
        Text(userInfo.maxSpace!,
          style: TextStyle(
            color: AppColors.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.userId!,
          style: TextStyle(
            color: AppColors.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.packageId!,
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
                return  const AlertDialogWidgetsOne(
                  title0: 'Add New Memory Quota',
                  title: 'Memory Name',
                  text1: 'Limit',
                  text2: 'Price',
                  text3: 'Cancel',
                  text4: 'add',
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