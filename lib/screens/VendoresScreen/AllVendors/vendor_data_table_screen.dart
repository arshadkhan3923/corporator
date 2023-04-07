import 'package:corporator/screens/VendoresScreen/AllVendors/vendor_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../Widgets/alert_wialog_widgets_one.dart';
import '../../../utils/app_colors.dart';

class VendorDataTable extends StatelessWidget {
  const VendorDataTable({
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
                        Text("UserId",
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
                    label: Text("Action",
                      style: TextStyle(
                        color: AppColors.grayColors,
                        fontSize: 22.sp
                    ),
                    ),
                  ),
                ],
                rows: List.generate(
                  vendorModel.length,
                  (index) => vendorUserDataRow(vendorModel[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow vendorUserDataRow(VendorDataTableModel userInfo, BuildContext context) {
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
        Text(userInfo.name!,
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
                return  const AlertDialogWidgetsOne(
                  title0: 'Add New Vendor',
                  title: 'Vendor Name',
                  text1: 'Vendor Id',
                  text2: 'Type',
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
