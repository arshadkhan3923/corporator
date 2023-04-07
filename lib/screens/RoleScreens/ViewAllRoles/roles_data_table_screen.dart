import 'package:corporator/screens/RoleScreens/ViewAllRoles/roles_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../Widgets/alert_wialog_widgets_one.dart';
import '../../../responsive.dart';
import '../../../utils/app_colors.dart';
import 'header.dart';


class RolesDataTable extends StatefulWidget {
  const RolesDataTable({
    Key? key,
  }) : super(key: key);

  @override
  State<RolesDataTable> createState() => _RolesDataTableState();
}

class _RolesDataTableState extends State<RolesDataTable> {
  final _searchController= TextEditingController();
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
                  "All Roles",
                  style: TextStyle(
                      color: AppColors.textColors,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500
                  )
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.bgColors,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.2,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialogWidgetsOne(
                        title0: 'Add New Roles',
                        title: 'Role Name',
                        text1: 'Role Id',
                        text2: 'Type',
                        text3: 'Cancel',
                        text4: 'Submit',
                      );
                    },
                  );
                },
                icon: Icon(Icons.add,size: 16.sp,),
                label: Text("Add New",style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.whiteColors,
                ),),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Text('Show',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColors,
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                height: 30.h,
                width: 41.w,
                decoration: BoxDecoration(
                  color: AppColors.adminBgColors,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Center(child: Text('10')),
              ),
              SizedBox(width: 10.w),
              Text('Entries',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColors,
                ),
              ),
              SizedBox(width: Get.width*.48),
              if(!Responsive.isMobile(context))
                SizedBox(
                    height: Get.height*.050,
                    width: Get.width*.2,
                    child:  SearchField(
                      controller: _searchController,
                      onChange: (String value){
                        setState(() {

                        });
                      },
                    )
                ),
            ],
          ),
          SizedBox(height: 10.h,),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: MediaQuery.of(context).size.width*.2,
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
                  rolesModel.length,
                  (index) => rolesUserDataRow(rolesModel[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow rolesUserDataRow(RolesDataTableModel userInfo, BuildContext context) {
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
                  title0: 'Add New Roles',
                  title: 'Role Name',
                  text1: 'Role Id',
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
