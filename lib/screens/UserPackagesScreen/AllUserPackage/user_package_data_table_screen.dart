import 'package:corporator/screens/UserPackagesScreen/AllUserPackage/user_package_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../utils/app_colors.dart';

class UserPackageDataTable extends StatelessWidget {
  const UserPackageDataTable({
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
                        Text("Package",
                          style: TextStyle(
                              color: AppColors.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down,
                          size: 22.sp,
                          color: AppColors.grayColors,
                        ),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Text("Package Id",
                      style: TextStyle(
                        color: AppColors.grayColors,
                        fontSize: 22.sp
                    ),
                    ),
                  ),
                ],
                rows: List.generate(
                  userPackageModel.length,
                  (index) => userPackageUserDataRow(userPackageModel[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow userPackageUserDataRow(UserPackageDataTableModel userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(userInfo.id!,
            style: TextStyle(
              color: AppColors.textColors,
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      DataCell(
        Text(userInfo.name!,
          style: TextStyle(
            color: AppColors.textColors,
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.package!,
        style: TextStyle(
        color: AppColors.textColors,
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ),
      ),
      ),
      DataCell(
        Text(userInfo.packageId!,
        style: TextStyle(
          color: AppColors.textColors,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      ),

    ],
  );
}
